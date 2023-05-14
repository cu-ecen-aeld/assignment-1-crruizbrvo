#!/bin/bash -x

set -e

scriptName=$0
destinationFile=$1
stringToAdd=$2
numOfArgs=$#

# This function takes as argument the number of arguments received by the script
validateNumOfArgs() {
    expectedNumOfArguments=2
    if [[ $1 -ne $expectedNumOfArguments ]] ; then
        echo "Incorrect number of arguments:"
        echo "Syntax:"
        echo "$scriptName /path/to/dir stringToAdding"
        exit 1
    fi
}


writeToFile() {
    mkdir -p $(dirname $1)
    echo $2 > $1
}

main() {

    validateNumOfArgs $numOfArgs

    writeToFile $destinationFile $stringToAdd
}

main