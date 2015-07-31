#!/bin/sh
#1 path to backup
#2 username 1
#3 password 1
#4 database 1
backup_date=`date +%Y_%m_%d_%H_%M_%S`
mysqldump -u$2 -p$3 $4 > $1/$4.${backup_date}.sql
tar -czvf $1/$4.${backup_date}.tgz $1/$4.${backup_date}.sql
rm $1/$4.${backup_date}.sql