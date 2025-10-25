#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"

USERID=(id -u)
 if [ $USERID -ne 0 ]
 then
    echo "You must have sudo access to exit the script"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2..... $R Failure"
        exit 1
    else
        echo -e "$2..... $R Success"
    fi
}

yum list installed mysql
if [ $? -ne 0 ]
then
    yum install mysql -y 
    VALIDATE $? "Installing MYSQL"
else
    echo -e "Mysql is already $Y installed"
fi

yum list installed git
if [ $? -ne 0 ]
then
    yum install git -y 
    VALIDATE $? "Installing git"
else
    echo -e "git is already $Y installed"
fi

