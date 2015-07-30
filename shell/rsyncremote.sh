#!/bin/sh
#1 remote user
#2 remote host
#3 remote folder
#4 local folder
rsync -abhviuzP --stats $1@$2:$3 $4