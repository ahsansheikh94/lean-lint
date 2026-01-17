#!/bin/bash

# Setup script for Git Pre-commit Hook
# This script helps you install the required formatters and linters

set -e

echo "🚀 Setting up Git Pre-commit Hook"
echo ""

# Check if hook exists
if [ ! -f ".git/hooks/pre-commit" ]; then
    echo "❌ Error: pre-commit hook not found!"
    echo "Make sure you're in the project root and Git is initialized."
    exit 1
fi

# Make hook executable
chmod +x .git/hooks/pre-commit
echo "✅ Pre-commit hook is now executable"

echo ""
echo "📦 Checking for required tools..."
echo ""

# Check Node.js tools
if command -v node &> /dev/null; then
    echo "✅ Node.js found"
    
    # Check Prettier
    if command -v prettier &> /dev/null; then
        echo "✅ Prettier found"
    else
        echo "⚠️  Prettier not found"
        read -p "Install Prettier globally? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            npm install -g prettier
        fi
    fi
    
    # Check ESLint
    if command -v eslint &> /dev/null; then
        echo "✅ ESLint found"
    else
        echo "⚠️  ESLint not found"
        read -p "Install ESLint globally? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            npm install -g eslint
        fi
    fi
else
    echo "⚠️  Node.js not found (needed for JS/TS formatting)"
fi

echo ""

# Check Python tools
if command -v python3 &> /dev/null; then
    echo "✅ Python3 found"
    
    # Check Black
    if command -v black &> /dev/null; then
        echo "✅ Black found"
    else
        echo "⚠️  Black not found"
        read -p "Install Black? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            pip3 install black
        fi
    fi
    
    # Check Flake8
    if command -v flake8 &> /dev/null; then
        echo "✅ Flake8 found"
    else
        echo "⚠️  Flake8 not found"
        read -p "Install Flake8? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            pip3 install flake8
        fi
    fi
else
    echo "⚠️  Python3 not found (needed for Python formatting)"
fi

echo ""
echo "✨ Setup complete!"
echo ""
echo "The pre-commit hook will now run automatically on every commit."
echo "Try staging and committing a file to test it!"

