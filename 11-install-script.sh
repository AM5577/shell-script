#!/bin/bash

USERID=(id -u)

if [ $USERID -ne 0 ]
    echo "Please run the script with sudo user"
fi

dnf list installed wget
if [ $? -ne 0 ]
then
    dnf install wget -y
    if [ $? -ne 0 ]
    then
        echo "Installtion ... Failure"
    else
        echo "Installation ...Sucess"
    fi
else
    echo "Wget already installed"
fi