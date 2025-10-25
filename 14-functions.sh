#!/bin/bash

USERID=(id -u)
 if [ $USERID -ne 0 ]
 then
    echo "You must have sudo access to exit the script"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2..... Failure"
        exit 1
    else
        echo "Installing MYSQL Success" b 
    fi
}

yum list installed mysql
if [ $? -ne 0 ]
then
    yum install mysql -y 
    VALIDATE $? "Installing MYSQL"
else
    echo "Mysql is already installed"
fi

yum list installed git
if [ $? -ne 0 ]
then
    yum install git -y 
    VALIDATE $? "Installing git"
else
    echo "git is already installed"
fi

