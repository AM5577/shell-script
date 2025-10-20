#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0 ]
then
    echo "ERROR: You must have sudo access to this script"
    exit 1 #otherthan zero
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
         echo "Installing mysql is not successful .. FAILURE"
        exit 1
    else
         echo "Installing mysql is succesfful ... SUCCESS"
    fi
else
    echo "Mysql is already installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
     dnf install git -y
     if [ $? -ne 0 ]
     then
          echo "Installation git .. FAILURE"
          exit 1
      else
          echo "Installation git .. SUCCESS"
     fi
else
     echo "GIT is already installed"
fi