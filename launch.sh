#!/bin/bash

# Usage: hack <project_name> [java]
# Examples:
#   hack my-script         -> Defaults to Python
#   hack my-app java       -> Sets up Java

PROJECT_NAME=$1
LANG_TYPE=${2:-python} # Defaults to python if 2nd arg is missing

# Check if user enterd project name
if [ -z "$PROJECT_NAME" ]; then
  echo "Error: You need a project name."
  echo "Usage: hack <project_name> [java]"
  exit 1
fi

# Create & Enter Directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

echo "Initializing $PROJECT_NAME..."

# Common Setup (Git & GitHub)
git init -b main
# Creates a Private repo by default. Change --private to --public if you want.
gh repo create "$PROJECT_NAME" --private --source=. --remote=origin

echo "# $PROJECT_NAME" > README.md

# Language Specific Setup
if [ "$LANG_TYPE" == "python" ]; then
    echo "Setting up Python..."

    # Python .gitignore (Standard + OS junk)
    curl -sL https://www.toptal.com/developers/gitignore/api/python,macos,windows > .gitignore

    # Create Virtual Env
    python3 -m venv venv
    
    # Create empty requirements
    touch requirements.txt

    # Create a runnable main.py
    cat <<EOT >> main.py
def main():
    print("Hello from $PROJECT_NAME")

if __name__ == "__main__":
    main()
EOT

elif [ "$LANG_TYPE" == "java" ]; then
    echo "Setting up Java..."

    # Java .gitignore (Classes, JARs, IDE configs)
    curl -sL https://www.toptal.com/developers/gitignore/api/java,macos,windows,visualstudiocode,intellij > .gitignore

    # Standard "Simple" Folder Structure
    mkdir -p src
    mkdir -p bin

    # Create Main.java
    # Capitalize the first letter of the project name
    CLASS_NAME="$(tr '[:lower:]' '[:upper:]' <<< ${PROJECT_NAME:0:1})${PROJECT_NAME:1}"
    
    cat <<EOT >> src/$CLASS_NAME.java
public class $CLASS_NAME {
    public static void main(String[] args) {
        
    }
}
EOT

    echo "Note: Source file is in src/$CLASS_NAME.java"

else
    echo "Unknown language. Created empty folder."
fi

# Secrets Management
touch .env
echo ".env" >> .gitignore

# Commit & Push
git add .
git commit -m "Initial commit: Project scaffold"
git push -u origin main

# Open VS Code (or your preferred editor)
echo "Ready to code."
code .
