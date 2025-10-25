#!/bin/bash

 #!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOGS_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOGS_FILE-$TIMESTAMP.log"
# Ensure log folder exits
mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2..... $R Failure $N"
        exit 1
    else
        echo -e "$2..... $R Success $N"
    fi
}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

 if [ $USERID -ne 0 ]
 then
    echo "You must have sudo access to exit the script"
    exit 1
fi

for package in $@
do
    yum list installed $package &>>$LOG_FILE_NAME
    if [ $? -ne 0 ]
    then
    yum install $package -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y installed  $N"
    fi
done