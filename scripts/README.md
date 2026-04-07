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
5. ✅ Create `src/` and `tests/` directories

### After Setup

```bash
# Activate the virtual environment
source venv/bin/activate

# Run tests with coverage
pytest --cov=src --cov-fail-under=80

# Run specific test
pytest tests/test_example.py -v

# Watch mode (auto-run on file changes)
pytest-watch tests/

# Format code with Black
black src/ tests/

# Lint code with Pylint
pylint src/

# Type checking with Pyright
pyright src/
```

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
- Coverage settings
