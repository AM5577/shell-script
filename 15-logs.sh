#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOGS_FILE-$TIMESTAMP.log"

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

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

yum list installed mysql &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    yum install mysql -y 
    VALIDATE $? "Installing MYSQL"
else
    echo -e "Mysql is already $Y installed"
fi

yum list installed git &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    yum install git -y 
    VALIDATE $? "Installing git"
else
    echo -e "git is already $Y installed"
fi

