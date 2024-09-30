#!/bin/bash

# Check if the Xcode project, workspace, or Package.resolved files have changed
if git diff --cached --name-only | grep -qE "(\.xcodeproj|\.xcworkspace|Package.resolved)"; then
    echo "Verifying Swift Package Manager dependencies..."

    # Run Swift Package Manager resolve command to check dependencies
    xcodebuild -resolvePackageDependencies
    if [[ $? != 0 ]]; then
        echo "Error: Dependencies are not properly resolved. Please fix the issues before committing."
        exit 1
    fi

    # Ensure that Package.resolved hasn't been manually modified
    if git diff --cached Package.resolved | grep '^\[-+\]'; then
        echo "Error: Manual modifications detected in Package.resolved. Please use Xcode's interface or SPM commands to update dependencies."
        exit 1
    fi

    echo "Dependencies verified successfully."
fi

exit 0
