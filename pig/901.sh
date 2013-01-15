#!/bin/sh
source /etc/profile
root=`dirname $0`
lastday=`date -d yesterday +%Y%m%d`
logfile=/usr/deploy/jmmq/logs/applog_${lastday}_*  
output=$root/output/901_$lastday
rm -rf $output
pig -x local -param out_dir=$output -param logfile=$logfile $root/901.pig 

#mail -s country_$lastday -c "he.hq@joymeng.com" ismtlee@gmail.com < $output/part-r-00000
#mail -s country_$lastday  he.hq@joymeng.com < $output/part-r-00000

find $root/output -type f -mtime +6 -exec rm {} \;
