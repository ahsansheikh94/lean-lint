# Git Pre-commit Hook: Auto-format & Lint

A custom Git pre-commit hook that automatically formats and lints only the files you've changed before each commit.

## Features

- ✅ **Auto-formats** staged files based on file type
- ✅ **Lints** staged files and prevents commit on errors
- ✅ **Only processes changed files** (efficient and fast)
- ✅ **Supports multiple languages**: JavaScript, TypeScript, Python, JSON, Markdown
- ✅ **Re-stages** formatted files automatically
- ✅ **Color-coded output** for better visibility

## Supported File Types

| File Type                     | Formatter | Linter        |
| ----------------------------- | --------- | ------------- |
| `.js`, `.jsx`, `.mjs`, `.cjs` | Prettier  | ESLint        |
| `.ts`, `.tsx`                 | Prettier  | ESLint        |
| `.py`                         | Black     | Flake8/Pylint |
| `.json`                       | Prettier  | -             |
| `.md`, `.markdown`            | Prettier  | -             |

## Installation

The hook is already installed in `.git/hooks/pre-commit`. If you need to reinstall it:

```bash
# Make sure the hook is executable
chmod +x .git/hooks/pre-commit
```

## Setup Required Tools

### For JavaScript/TypeScript Projects

```bash
# Install Prettier (formatter)
npm install -g prettier
# or locally: npm install --save-dev prettier

# Install ESLint (linter)
npm install -g eslint
# or locally: npm install --save-dev eslint
```

### For Python Projects

```bash
# Install Black (formatter)
pip install black

# Install Flake8 (linter)
pip install flake8
# or Pylint
pip install pylint
```

## How It Works

1. When you run `git commit`, the hook automatically runs
2. It detects all staged files
3. For each file, it:
   - Formats the file using the appropriate formatter
   - Lints the file using the appropriate linter
   - Re-stages the formatted file
4. If linting errors are found, the commit is aborted
5. If everything passes, the commit proceeds

## Usage Example

```bash
# Stage some files
git add src/index.js src/utils.py

# Commit (hook runs automatically)
git commit -m "Add new features"

# Output:
# 🔍 Checking staged files...
# Processing: src/index.js
#   Formatting src/index.js with Prettier...
#   Linting src/index.js with ESLint...
# Processing: src/utils.py
#   Formatting src/utils.py with Black...
#   Linting src/utils.py with Flake8...
# 📝 Re-staging formatted files...
# ✅ All files formatted and linted successfully!
```

## Bypassing the Hook

If you need to bypass the hook (not recommended), use:

```bash
git commit --no-verify -m "Your message"
```

## Customization

You can edit `.git/hooks/pre-commit` to:

- Add support for more file types
- Change formatter/linter commands
- Modify error handling behavior
- Add custom formatting rules

## Troubleshooting

### Hook not running?

- Make sure the file is executable: `chmod +x .git/hooks/pre-commit`
- Check that Git hooks are enabled (they are by default)

### Formatter/Linter not found?

- Install the required tools (see Setup section above)
- Make sure they're in your PATH
- For npm packages, you can use `npx` as a fallback

### Want to skip formatting for a specific commit?

- Use `git commit --no-verify` (not recommended for production)

## Notes

- The hook only processes **staged files** (files you've added with `git add`)
- Formatted files are automatically re-staged
- If linting fails, the commit is aborted and you'll see error messages
- The hook gracefully handles missing tools (shows warnings but doesn't fail)
