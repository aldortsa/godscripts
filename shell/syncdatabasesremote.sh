#!/bin/sh

#1 path to backup
#2 username 1
#3 password 1
#4 database 1
#5 host1
#6 username 2
#7 password 2
#8 database 2
#9 host2
#10 domain1
#11 domain2
backup_date=`date +%Y_%m_%d_%H_%M_%S`
ssh root@23.253.175.99 "mysqldump -u$2 -hlocalhost -p$3 $4" > $1/$4.${backup_date}.stag.sql

mysqldump -u$6 -p$7 -h$9 $8 > $1/$8.${backup_date}.prod.sql
tar -czvf $1/$8.${backup_date}.tgz $1/$8.${backup_date}.prod.sql
sed -i "s/${10}/${11}/g" $1/$4.${backup_date}.stag.sql

mysql -u$6 -p$7 -h$9 $8 < $1/$4.${backup_date}.stag.sql
rm $1/$8.${backup_date}.prod.sql
rm $1/$4.${backup_date}.stag.sql