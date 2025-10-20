#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run the script with sudo user"
    exit 1
fi

dnf list installed wget

if [ $? -ne 0 ]
then
    dnf install wget -y
    if [ $? -ne 0 ]
    then
        echo "Installtion ... Failure"
        exit 1
    else
        echo "Installation ...Sucess"
    fi
else
    echo "Wget already installed"
fi