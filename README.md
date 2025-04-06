🔒 Pre-Commit Hooks for iOS Projects

This repository contains a powerful and customizable pre-commit hook designed to maintain code quality and stability in iOS projects. It helps prevent common issues from being committed by enforcing standards and performing checks before code enters the repository.
✅ What It Does

    ✅ Runs SwiftLint to enforce style and conventions

    ✅ Ensures the project builds successfully before committing

    ✅ Blocks commits with warnings, errors, or broken builds

    ✅ Improves code consistency and team workflow

💡 Features

    Supports Swift and Objective-C projects

    Compatible with Xcode and command-line workflows

    Easy setup with a ready-to-use script

    Customizable to fit your team's CI/CD standards

⚙️ How It Works

    On each git commit, the hook:

        Lints the code using SwiftLint

        Attempts to build the project using xcodebuild

        Aborts the commit if any errors or warnings are detected

🚀 Setup Instructions

    Copy the pre-commit file into your project’s .git/hooks/ directory

    Make it executable:

    chmod +x .git/hooks/pre-commit

    Customize paths, targets, or rules as needed

🧪 Benefits

    Prevents broken code from reaching your codebase

    Saves time on PR reviews by catching issues early

    Enforces coding standards consistently across the team
