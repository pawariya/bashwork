#!/bin/bash

#A Simple Password Generator

echo "Welcome! This a password generator!"
echo "Please enter the length of the password: "
read PASS_LENGTH
echo "How many passwords do you want to generate? "
read COUNT

for ((i= 1; i <= COUNT; i++));
do
        openssl rand -base64 48 | cut -c1-$PASS_LENGTH
done
