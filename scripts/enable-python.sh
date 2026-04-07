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
# 5. Create src and tests directories if they don't exist
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
echo "Next steps:"
echo "  1. Activate the environment: source venv/bin/activate"
echo "  2. Write tests first (TDD): pytest tests/"
echo "  3. Implement code in src/"
echo "  4. Check coverage: pytest --cov=src --cov-fail-under=80"
echo ""
echo "Happy coding! 🚀"
