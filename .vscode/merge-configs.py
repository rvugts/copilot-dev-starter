#!/usr/bin/env python3
"""
Merge VS Code settings and extensions from language-specific configs.

This script is called by language setup scripts (e.g., enable-python.sh)
to merge language-specific VS Code configurations into the main settings.

Usage:
  python .vscode/merge-configs.py python
"""

import json
import sys
from pathlib import Path


def merge_extensions(language: str) -> None:
    """Merge language-specific extensions into main extensions.json."""
    vscode_dir = Path(".vscode")
    main_file = vscode_dir / "extensions.json"
    lang_file = vscode_dir / f"extensions.{language}.json"

    if not lang_file.exists():
        print(f"⚠️  {lang_file} not found, skipping extensions merge")
        return

    # Load both files
    with open(main_file) as f:
        main = json.load(f)
    with open(lang_file) as f:
        lang = json.load(f)

    # Merge recommendations (unique)
    merged_recs = list(dict.fromkeys(main["recommendations"] + lang["recommendations"]))

    # Write back
    with open(main_file, "w") as f:
        json.dump({"recommendations": merged_recs}, f, indent=2)

    print(f"✅ Merged {lang_file.name} → extensions.json ({len(merged_recs)} total)")


def merge_settings(language: str) -> None:
    """Merge language-specific settings into main settings.json."""
    vscode_dir = Path(".vscode")
    main_file = vscode_dir / "settings.json"
    lang_file = vscode_dir / f"settings.{language}.json"

    if not lang_file.exists():
        print(f"⚠️  {lang_file} not found, skipping settings merge")
        return

    # Load both files
    with open(main_file) as f:
        main = json.load(f)
    with open(lang_file) as f:
        lang = json.load(f)

    # Merge: language-specific settings override main
    merged = {**main, **lang}

    # Write back
    with open(main_file, "w") as f:
        json.dump(merged, f, indent=2)

    print(f"✅ Merged {lang_file.name} → settings.json")


def main() -> None:
    """Merge VS Code configs for a specific language."""
    if len(sys.argv) < 2:
        print("Usage: python .vscode/merge-configs.py <language>")
        print("Example: python .vscode/merge-configs.py python")
        sys.exit(1)

    language = sys.argv[1]

    print(f"🔧 Merging {language} VS Code configuration...")
    merge_extensions(language)
    merge_settings(language)
    print("✅ VS Code configuration updated!")


if __name__ == "__main__":
    main()
