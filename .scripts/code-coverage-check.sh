#!/bin/bash

# Check code coverage using slather
coverage=$(slather coverage)

# Validate the code coverage threshold
if (( $(echo "$coverage < 80" | bc -l) )); then
    echo "Error: Code coverage is below 80%. Please add more tests."
    exit 1
fi

# If coverage check passes
echo "Code coverage is valid."
exit 0

