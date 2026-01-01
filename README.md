# 🚀 Launchpad

**Kill decision fatigue. Go from idea to code in one command.**

Launchpad is a workflow automation tool designed to eliminate the tedious "setup" phase of starting a new project. It automates directory creation, environment configuration, and GitHub repository initialization so you can focus strictly on the logic.

## ✨ Features

- **⚡ Instant GitHub Integration:** Automatically creates a private repo via GitHub CLI (`gh`), initializes Git, and pushes the first commit.
- **🐍 Python Automation:**
  - Creates a virtual environment (`venv`).
  - Generates a `main.py` entry point.
  - Creates `requirements.txt` and a standard `.gitignore`.
- **☕ Java Automation:**
  - Sets up a clean `src/` directory structure.
  - Auto-generates the Main Class file (handles capitalization automatically).
  - Fetches a robust `.gitignore` for Java/IntelliJ/VS Code.
- **🧠 Zero Friction:**
  - Auto-creates `.env` for secrets.
  - Opens the project immediately in VS Code (`code .`).

---

## 💻 Compatibility
This script is written in **Bash**. It works natively on:
- **macOS**
- **Linux** (Ubuntu, Debian, Fedora, etc.)
- **Windows** (via **WSL** or Git Bash)

---

## 🛠 Prerequisites (First Run Only)

Before using the script, you must have the following tools installed.

### 1. Install GitHub CLI (`gh`)
You need the GitHub CLI to automate repo creation.
- **macOS:** `brew install gh`
- **Windows:** `winget install GitHub.cli`
- **Linux:** [See installation guide](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)

### 2. Authenticate GitHub
Once installed, log in to your account (you only do this once):
```bash
gh auth login