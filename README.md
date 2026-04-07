# Copilot Dev Starter

A comprehensive starter template for Copilot-powered development projects. Includes agent rules, skills, templates, and workflows supporting Specification-Driven Development (SDD) and Test-Driven Development (TDD).

This repository provides:
- GitHub Copilot agent rules and instructions in `.github/`
- Copilot skills and prompts for secure coding, prompt creation, refactoring, and testing
- Templates and docs supporting Specification-Driven Development (SDD) and Test-Driven Development (TDD)
- Architecture Decision Records in `docs/adr/`

## Key files

- `LICENSE.md` — project license
- `README.md` — project overview
- `CONTRIBUTING.md` — guidelines for extending the template
- `CODE_OF_CONDUCT.md` — community standards
- `docs/DEVELOPMENT.md` — development workflow and standards
- `docs/TROUBLESHOOTING.md` — common issues and fixes
- `.github/copilot-instructions.md` — repository-wide Copilot guidance
- `.github/instructions/` — language-specific instruction files
- `.github/skills/` — reusable Copilot skills
- `.github/workflows/ci-python.template.yml` — example CI workflow for Python (copy and customize)
- `.github/workflows/ci-nodejs.template.yml` — example CI workflow for Node.js (copy and customize)

## Getting started

1. Review `.github/copilot-instructions.md`
2. Read `docs/DEVELOPMENT.md` for workflow and quality standards
3. Create a new feature using `docs/spec.template.md`
4. Write tests first, then implement code
5. Use the Copilot skills in `.github/skills/` as needed

## Contributing

This repository is intended as a starting point for Copilot-powered projects. If you want to extend the template:
- Add new `docs/` templates for your workflow
- Add new Copilot skills in `.github/skills/`
- Keep the root docs and license up to date
