# Scripts

This folder contains setup and automation scripts for initializing different language environments.

## Python Setup

To enable Python development in your project:

```bash
bash scripts/enable-python.sh
```

This script will:
1. ✅ Create a Python virtual environment (`venv/`)
2. ✅ Install dependencies from `requirements.txt`
3. ✅ Enable GitHub Actions CI workflow (from `ci-python.template.yml`)
4. ✅ Install pre-commit hook for code quality
5. ✅ Merge Python VS Code settings and extensions
6. ✅ Create `Makefile` with common development commands
7. ✅ Create `src/` and `tests/` directories

### After Setup

```bash
# Activate the virtual environment
source venv/bin/activate

# View all available commands
make help

# Run tests with coverage
make test

# Run tests in watch mode (auto-reload on file changes)
make test-watch

# Format code with Black
make format

# Run linters
make lint

# Run type checking
make type-check

# Run all checks (lint, format, type-check, test)
make all
```

## What Gets Created/Modified

The script creates or modifies these files in your project root:

| File | Purpose |
|------|---------|
| `venv/` | Python virtual environment |
| `Makefile` | Development commands (copied from `Makefile.python.template`) |
| `.github/workflows/ci.yml` | GitHub Actions CI (copied from `.github/ci-templates/ci-python.template.yml`) |
| `.git/hooks/pre-commit` | Pre-commit hook (copied from `.github/hooks/pre-commit.template`) |
| `.vscode/settings.json` | Updated with Python-specific settings |
| `.vscode/extensions.json` | Updated with Python-specific extensions |
| `src/__init__.py` | Python source directory marker |
| `tests/__init__.py` | Python tests directory marker |

### VS Code Configuration Merge

The Python setup automatically:
1. Reads `.vscode/settings.python.json` and merges into `.vscode/settings.json`
2. Reads `.vscode/extensions.python.json` and merges into `.vscode/extensions.json`
3. Sets Python interpreter path to `venv/bin/python`

This ensures that template users who don't use Python are not polluted with Python extensions and settings, but Python users get a fully configured VS Code experience.

See [.vscode/README.md](.vscode/README.md) for more details on the VS Code configuration system.

## Dependencies

The `requirements.txt` includes:
- **pytest** - Testing framework
- **pydantic** - Data validation
- **black** - Code formatter
- **flake8** - Linter
- **pylint** - Code analysis
- **pyright** - Type checker
- **python-dotenv** - Environment management

The `pyproject.toml` contains full project configuration including:
- Project metadata
- Dependency specifications
- Tool configurations (pytest, black, pylint, pyright)
- Coverage settings (minimum 80%)

