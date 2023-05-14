#!/bin/bash

set -e

scriptName=$0
filesdir=$1
searchstr=$2
numOfArgs=$#

# This function takes as argument a number and compares it to the expected number of
# arguments of the script. Prins an error and exist if comparison fails
validateNumOfArgs() {
    expectedNumOfArguments=2
    if [[ $1 -ne $expectedNumOfArguments ]] ; then
        echo "Incorrect number of arguments:"
        echo "Syntax:"
        echo "$scriptName /path/to/dir searchString"
        exit 1
    fi
}

# This function takes as argument a directory path and checks it is valid
validateSourceDir() {
    if [[ !(( -d $1 )) ]] ; then
        echo "$filesdir directory not found. Please make sure the directory exists"
        echo "Syntax:"
        echo "$scriptName /path/to/dir searchString"
        exit 1
    fi    
}

# This function takes as argument the directory to be searched and returns the number of files it contains
countFiles() {
    filesCount=$(find $1 -type f | wc -l)
    echo $filesCount
}

# This function takes as arguments the string to match and the directory to search and counts how many lines match
countMatchingLines() {
    matchingLinesCount=$(grep -rs $1 $2 | wc -l)
    echo $matchingLinesCount
}

main() {

    validateNumOfArgs $numOfArgs
    validateSourceDir $filesdir

    echo "The number of files are $(countFiles $filesdir) and the number of matching lines are $(countMatchingLines $searchstr $filesdir)"
}

main