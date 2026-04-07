#!/bin/bash

# Enable Python Development Environment
# This script sets up a Python project with:
# - Virtual environment (venv)
# - GitHub Actions CI workflow
# - Python dependencies for SDD/TDD
# - VS Code Python extensions and settings
# - Pre-commit hooks

set -e

echo "🐍 Enabling Python Development Environment..."
echo ""

# ============================================================================
# 1. Create Virtual Environment
# ============================================================================

if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
    echo "✅ Virtual environment created"
else
    echo "✅ Virtual environment already exists"
fi

echo ""

# ============================================================================
# 2. Activate Virtual Environment and Install Dependencies
# ============================================================================

echo "📚 Installing dependencies..."
source venv/bin/activate
pip install --upgrade pip setuptools wheel
pip install -r requirements.txt
echo "✅ Dependencies installed"

echo ""

# ============================================================================
# 3. Enable Python GitHub Actions CI Workflow
# ============================================================================

if [ ! -f ".github/workflows/ci.yml" ]; then
    echo "🚀 Enabling GitHub Actions CI workflow..."
    cp .github/ci-templates/ci-python.template.yml .github/workflows/ci.yml
    echo "✅ CI workflow enabled at .github/workflows/ci.yml"
else
    echo "✅ CI workflow already exists at .github/workflows/ci.yml"
fi

echo ""

# ============================================================================
# 4. Install Pre-commit Hook
# ============================================================================

if [ ! -f ".git/hooks/pre-commit" ]; then
    echo "🔒 Installing pre-commit hook..."
    cp .github/hooks/pre-commit.template .git/hooks/pre-commit
    chmod +x .git/hooks/pre-commit
    echo "✅ Pre-commit hook installed"
else
    echo "✅ Pre-commit hook already installed"
fi

echo ""

# ============================================================================
# 5. Merge Python VS Code Configuration
# ============================================================================

echo "🔧 Merging Python VS Code settings and extensions..."
python3 .vscode/merge-configs.py python
echo "✅ VS Code configuration updated"

echo ""

# ============================================================================
# 6. Create Makefile for Python Commands
# ============================================================================

if [ ! -f "Makefile" ]; then
    echo "📋 Creating Makefile..."
    cp Makefile.python.template Makefile
    echo "✅ Makefile created (run 'make help' to see available commands)"
else
    echo "✅ Makefile already exists"
fi

echo ""

# ============================================================================
# 7. Create src and tests directories if they don't exist
# ============================================================================

if [ ! -d "src" ]; then
    echo "📁 Creating src directory..."
    mkdir -p src
    touch src/__init__.py
    echo "✅ src/ directory created"
fi

if [ ! -d "tests" ]; then
    echo "📁 Creating tests directory..."
    mkdir -p tests
    touch tests/__init__.py
    echo "✅ tests/ directory created"
fi

echo ""

# ============================================================================
# ✨ Setup Complete
# ============================================================================

echo "✨ Python environment is ready!"
echo ""
echo "Setup includes:"
echo "  ✅ Virtual environment (venv/)"
echo "  ✅ Dependencies (pytest, pydantic, black, pylint, pyright, etc)"
echo "  ✅ GitHub Actions CI workflow (.github/workflows/ci.yml)"
echo "  ✅ Pre-commit hooks (.git/hooks/pre-commit)"
echo "  ✅ VS Code configuration (settings.json, extensions.json merged)"
echo "  ✅ Makefile with common commands (test, lint, format, etc)"
echo ""
echo "Next steps:"
echo "  1. Activate: source venv/bin/activate"
echo "  2. View commands: make help"
echo "  3. Write tests first: pytest tests/"
echo "  4. Check coverage: make test"
echo ""
echo "Happy coding! 🚀"
