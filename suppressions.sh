#!/bin/zsh

#name of the suppressions file
FILENAME="suppressions.txt"
#executable name
NAME="hercules"
#temp file
TEMP="tempfile.txt"
# valgrind location
VAL=/Volumes/Storage/goinfre/akalmyko/homebrew/Cellar/valgrind/3.12.0/bin/valgrind

#compile the executable
#sh compile.sh

# generate file
$VAL --gen-suppressions=all --leak-check=full --show-leak-kinds=all ./$NAME 2>./$TEMP

# delete all == and --
cat $TEMP | grep -v "==" | grep -v "\-\-" | grep -v "warning" > $FILENAME

# delete temp file
rm $TEMP
clear

# use valgrind again, with the suppressions file
#$VAL --suppressions=./$FILENAME ./$NAME

# delete text file
#rm $FILENAME
