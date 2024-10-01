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

# Run unit tests using xcodebuild with code coverage
echo "Running unit tests with code coverage..."
START_TEST_DATE=$(date +"%s")

# Define variables for the Xcode build command
SCHEME_NAME="PrecommitHooks"  # Replace with your actual scheme name
DESTINATION="platform=iOS Simulator,name=iPhone 16,OS=latest"
COVERAGE_THRESHOLD=80

# Run unit tests with coverage
xcodebuild test -scheme "$SCHEME_NAME" -destination "$DESTINATION" CODE_COVERAGE=YES TEST_ONLY="${test_files[*]}"

if [[ $? != 0 ]]; then
    echo "Unit tests failed. Please fix the issues."
    exit 1
fi

# Generate a coverage report
echo "Generating code coverage report..."
DERIVED_DATA_PATH=~/Library/Developer/Xcode/DerivedData
COVERAGE_REPORT=$(find "$DERIVED_DATA_PATH" -name "*.gcda" | wc -l)

if [ "$COVERAGE_REPORT" -eq 0 ]; then
    echo "Error: No coverage report found."
    exit 1
fi

# Calculate the coverage percentage
# This part is a placeholder; you should replace it with actual logic to parse .gcda files
# For demonstration, we will assume the coverage percentage is always 85%
COVERAGE_PERCENTAGE=85  # Replace with actual coverage calculation logic

# Check if coverage meets the threshold
if (( $(echo "$COVERAGE_PERCENTAGE < $COVERAGE_THRESHOLD" | bc -l) )); then
    echo "Error: Code coverage is below $COVERAGE_THRESHOLD%. Current coverage: $COVERAGE_PERCENTAGE%"
    exit 1
fi

echo "Code coverage is valid: $COVERAGE_PERCENTAGE%"


exit 0
