#!/bin/sh

#1 path to backup
#2 username 1
#3 password 1
#4 database 1
#5 username 2
#6 password 2
#7 database 2
#8 domain1
#9 domain2
backup_date=`date +%Y_%m_%d_%H_%M_%S`
mysqldump -u$2 -p$3 $4 > $1/$4.${backup_date}.sql
tar -czvf $1/$4.${backup_date}.tgz $1/$4.${backup_date}.sql

mysqldump -u$5 -p$6 $7 > $1/$7.${backup_date}.sql
tar -czvf $1/$7.${backup_date}.tgz $1/$7.${backup_date}.sql
sed -i "s/$8/$9/g" $1/$4.${backup_date}.sql

mysql -u$5 -p$6 $7 < $1/$4.${backup_date}.sql
rm $1/$7.${backup_date}.sql
rm $1/$4.${backup_date}.sql