@echo off
setlocal enabledelayedexpansion

REM Assign project name to a variable
set PROJECT_NAME=ProjectName

echo 🚀 Creating %PROJECT_NAME% project...

REM Create the main directory
mkdir %PROJECT_NAME%
cd %PROJECT_NAME%

REM Create the solution
dotnet new sln

REM Create main folders
mkdir src
mkdir tests

REM Domain Layer
echo 📦 Creating Domain Layer...
dotnet new classlib -o src\%PROJECT_NAME%.Domain
dotnet add src\%PROJECT_NAME%.Domain\%PROJECT_NAME%.Domain.csproj package MongoDB.Bson

REM Application Layer
echo 📦 Creating Application Layer...
dotnet new classlib -o src\%PROJECT_NAME%.Application
dotnet add src\%PROJECT_NAME%.Application\%PROJECT_NAME%.Application.csproj package AutoMapper
dotnet add src\%PROJECT_NAME%.Application\%PROJECT_NAME%.Application.csproj reference src\%PROJECT_NAME%.Domain\%PROJECT_NAME%.Domain.csproj

REM Infrastructure Layer
echo 📦 Creating Infrastructure Layer...
dotnet new classlib -o src\%PROJECT_NAME%.Infrastructure
dotnet add src\%PROJECT_NAME%.Infrastructure\%PROJECT_NAME%.Infrastructure.csproj package MongoDB.Driver
dotnet add src\%PROJECT_NAME%.Infrastructure\%PROJECT_NAME%.Infrastructure.csproj reference src\%PROJECT_NAME%.Domain\%PROJECT_NAME%.Domain.csproj
dotnet add src\%PROJECT_NAME%.Infrastructure\%PROJECT_NAME%.Infrastructure.csproj reference src\%PROJECT_NAME%.Application\%PROJECT_NAME%.Application.csproj

REM API Layer
echo 📦 Creating API Layer...
dotnet new webapi -o src\%PROJECT_NAME%.API
dotnet add src\%PROJECT_NAME%.API\%PROJECT_NAME%.API.csproj reference src\%PROJECT_NAME%.Domain\%PROJECT_NAME%.Domain.csproj
dotnet add src\%PROJECT_NAME%.API\%PROJECT_NAME%.API.csproj reference src\%PROJECT_NAME%.Application\%PROJECT_NAME%.Application.csproj
dotnet add src\%PROJECT_NAME%.API\%PROJECT_NAME%.API.csproj reference src\%PROJECT_NAME%.Infrastructure\%PROJECT_NAME%.Infrastructure.csproj

REM Test projects
echo 📦 Creating test projects...
dotnet new xunit -o tests\%PROJECT_NAME%.UnitTests
dotnet new xunit -o tests\%PROJECT_NAME%.IntegrationTests

REM Add projects to solution
echo 🔗 Adding projects to the solution...
for /r src %%f in (*.csproj) do (
    echo Adding: %%f
    dotnet sln add %%f
)
for /r tests %%f in (*.csproj) do (
    echo Adding: %%f
    dotnet sln add %%f
)

REM Create folder structure
call create-folders.bat

echo ✅ %PROJECT_NAME% project successfully created!
pause
