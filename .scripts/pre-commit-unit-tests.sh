#!/bin/bash

# Get the list of changed files
changed_files=$(git diff --cached --name-only)

# Filter for Swift files related to unit tests
test_files=()
for file in $changed_files; do
    if [[ $file == *Tests/*.swift ]]; then
        test_files+=("$file")
    fi
done

# Check if there are any updated or new test files
if [ ${#test_files[@]} -eq 0 ]; then
    echo "No updated or new unit tests to run."
    exit 0
fi

# Print the files that will be tested
echo "Running unit tests for the following files:"
printf '%s\n' "${test_files[@]}"

# Run unit tests using xcodebuild
echo "Running unit tests..."
START_TEST_DATE=$(date +"%s")
xcodebuild test -scheme PrecommitHooks -destination 'platform=iOS Simulator,name=iPhone 16,OS=latest' TEST_ONLY="${test_files[*]}"

if [[ $? != 0 ]]; then
    echo "Unit tests failed. Please fix the issues."
    exit 1
fi

END_TEST_DATE=$(date +"%s")
TEST_DIFF=$(($END_TEST_DATE - $START_TEST_DATE))

echo "Unit tests took $(($TEST_DIFF / 60)) minutes and $(($TEST_DIFF % 60)) seconds to complete."
exit 0
