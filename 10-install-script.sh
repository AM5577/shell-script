#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0 ]
then
    echo "ERROR: You must have sudo access to this script"
    exit 1 #otherthan zero
fi

dnf list installed mysql

if [$? -ne 0 ]
    dnf install mysql -y
then
    echo "Installing mysql is not successful .. FAILURE"
    exit 1
else
    echo "Installing mysql is succesfful ... SUCCESS"
fi
else
    echo "Mysql is already installed"
fi


# if [ $? -ne 0 ]
# then
#     echo "Installing mysql is not successful .. FAILURE"
#     exit 1
# else
#     echo "Installing mysql is succesfful ... SUCCESS"
# fi

if [ $? -ne 0 ]
then
    echo "Installing git is not succesfull ...FAILURE"
    exit 1
    echo "Installing git successfull...SUCCESS"
fi
dnf install git -y