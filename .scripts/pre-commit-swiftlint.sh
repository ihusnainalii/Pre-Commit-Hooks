#!/bin/bash

# Apple Silicon compatibility
if [[ "$(uname -m)" == arm64 ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# Variables
SWIFT_LINT=/usr/local/bin/swiftlint
hasErrors=0

# Run SwiftLint for given filename
run_swiftlint() {
    local filename="${1}"
    if [[ "${filename##*.}" == "swift" ]]; then
        ${SWIFT_LINT} lint --path "${filename}"
        if [[ $? != 0 ]]; then
            hasErrors=1
        fi
    fi
}

if [[ -e "${SWIFT_LINT}" ]]; then
    echo "SwiftLint version: $(${SWIFT_LINT} version)"
    
    # Run for staged files
    for filename in $(git diff --diff-filter=d --name-only);
    do
        run_swiftlint "${filename}";
    done

    # Run for unstaged files
    for filename in $(git diff --cached --diff-filter=d --name-only);
    do
        run_swiftlint "${filename}";
    done
    
    # Run for added files
    for filename in $(git ls-files --others --exclude-standard);
    do
        run_swiftlint "${filename}";
    done
else
    echo "${SWIFT_LINT} is not installed."
    exit 0
fi

# Exit if there are any errors
if [[ $hasErrors -ne 0 ]]; then
    echo "SwiftLint checks failed. Please fix the above issues."
    exit 1
fi

exit 0
