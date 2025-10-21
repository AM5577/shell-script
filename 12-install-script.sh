#!/bin/bash

USERID=$(id -u)
if [ USERID -ne 0 ]
then    
     echo "Please run with root user"
fi

yum list installed mysql
if [ $? -ne 0 ]
then
     yum install mysql -y
     if [ $? -ne 0 ]
     then
         echo "Installing MYSQL sucesss"
     else
         echo "Installing MYSQL failure"
fi
