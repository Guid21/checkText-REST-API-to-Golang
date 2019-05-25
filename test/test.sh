#!/bin/bash

# Test 1
TEST1=$(curl --fail --silent --show-error --max-time 5 -d "@testPost1.json" -X POST http://localhost:8080/checkText)
str1=$(echo "{\"found-at-sites\":[\"https://hh.ru\"]}")
if [ $str1 == $TEST1 ]
then
    echo -e "Test 1 \e[32mOK\e[0m"
else
    echo -e "Test 1 \e[31mfail\e[0m"
fi

# Test 2
TEST1=$(curl --fail --silent --show-error --max-time 5 -d "@testPost2.json" -X POST http://localhost:8080/checkText)
str1=$(echo "{\"found-at-sites\":[\"https://google.com\",\"https://yahoo.com\",\"https://mail.ru\",\"https://hh.ru\"]}")
if [ $str1 == $TEST1 ]
then
    echo -e "Test 2 \e[32mOK\e[0m"
else
    echo -e "Test 2 \e[31mfail\e[0m"
fi

# Test 3
TEST1=$(curl --fail --silent --show-error --max-time 5 -d "@testPost3.json" -X POST http://localhost:8080/checkText)
str1=$(echo "{\"found-at-sites\":[\"https://mail.ru\",\"https://hh.ru\"]}")
if [ $str1 == $TEST1 ]
then
    echo -e "Test 3 \e[32mOK\e[0m"
else
    echo -e "Test 3 \e[31mfail\e[0m"
fi

# Test 4
TEST1=$(curl --fail --silent --show-error --max-time 5 -d "@testPost4.json" -X POST http://localhost:8080/checkText)
str1=$(echo "{\"found-at-sites\":[\"https://google.com\",\"https://yahoo.com\",\"https://mail.ru\",\"https://hh.ru\"]}")
if [ $str1 == $TEST1 ]
then
    echo -e "Test 4 \e[32mOK\e[0m"
else
    echo -e "Test 4 \e[31mfail\e[0m"
fi

# Test 5
TEST1=$(curl --fail --silent --show-error -d "@testPost5.json" -X POST http://localhost:8080/checkText)
str1=$(echo "{\"found-at-sites\":[\"https://google.com\",\"https://yahoo.com\",\"https://mail.ru\",\"https://hh.ru\"]}")
if [ $str1 == $TEST1 ]
then
    echo -e "Test 5 \e[32mOK\e[0m"
else
    echo -e "Test 5 \e[31mfail\e[0m"
fi



# Test 6
TEST1=$(curl --fail --silent --show-error --max-time 5 --write-out '%{http_code}\n' -d "@testPost6.json" -X POST http://localhost:8080/checkText)
str1=$(echo "204")
 if [ $str1 == $TEST1 ]
then
    echo -e "Test 6 \e[32mOK\e[0m => status 204"
else
    echo -e "Test 6 \e[31mfail\e[0m status $TEST1"
fi