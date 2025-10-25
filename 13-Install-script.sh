#!/bin/bash

USERID=(id -u)
 if [ $USERID -ne 0 ]
 then
    echo "You must have sudo access to exit the script"
    exit 1
fi

yum list installed mysql
if [ $? -ne 0 ]
then
    yum install mysql -y 
    if [ $? -ne 0 ]
    then 
        echo "Installing MYSQL Failure"
        exit 1
    else
        echo "Installing MYSQL Success"
    fi
else
    echo "Mysql is already installed"
fi

