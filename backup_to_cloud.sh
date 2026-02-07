#!/bin/bash

SOURCE_DIR="important_data"
BUCKET_NAME="linux-backup-danysh-21"
BACKUP_FILE="backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

echo "Compressing file...."
tar -czf $BACKUP_FILE $SOURCE_DIR

echo "Uploading to S3....."
aws s3 cp $BACKUP_FILE s3://$BUCKET_NAME/

if [ $? -eq 0 ]; then
    echo "Sucess! Backup uploaded to s3://$BUCKET_NAME/$BUCKET_FILE"

    rm $BACKUP_FILE
    echo "local backup file removed"
else
    echo "Error: Backup failed.please check your aws key."
fi
