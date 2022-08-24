#/bin/bash

FILE_CHECK=`ls -al | grep a.out | wc -l`
echo $FILE_CHECK
if [ $FILE_CHECK != 0 ]
then
    echo "invalid turn-in files"
else
    gcc -Wall -Werror -Wextra -fsanitize=address *.c
    ./a.out | cat -e > test.txt
    DIFF_LEN=`diff test.txt result.txt | wc -l`
    if [ $DIFF_LEN == 0 ]
    then
        echo "OK"
    else
        echo "KO"
        diff test.txt result.txt
    fi
    rm a.out test.txt
fi

