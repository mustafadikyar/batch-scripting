mkdir src\%PROJECT_NAME%.Domain\Common

REM Folders for the Application layer
mkdir src\%PROJECT_NAME%.Application\Common\Behaviors
mkdir src\%PROJECT_NAME%.Application\Common\Interfaces
mkdir src\%PROJECT_NAME%.Application\DTOs
mkdir src\%PROJECT_NAME%.Application\Features
mkdir src\%PROJECT_NAME%.Application\Mappings

REM Folders for the Infrastructure layer
mkdir src\%PROJECT_NAME%.Infrastructure\Authentication
mkdir src\%PROJECT_NAME%.Infrastructure\Persistence
mkdir src\%PROJECT_NAME%.Infrastructure\Services

REM Folders for the API layer
mkdir src\%PROJECT_NAME%.API\GraphQL\Mutations
mkdir src\%PROJECT_NAME%.API\GraphQL\Queries
mkdir src\%PROJECT_NAME%.API\GraphQL\Types
mkdir src\%PROJECT_NAME%.API\Configuration

echo ✅ Folder structure successfully created!
