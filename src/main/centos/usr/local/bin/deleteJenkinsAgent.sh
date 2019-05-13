#!/bin/bash
set -xev
source /etc/profile
#
echo "当前目录"
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
echo ${SHELL_FOLDER}
cd ${SHELL_FOLDER}
#
echo 定时任务$(date '+%Y-%m-%d %H:%M:%S')删除jenkins节点心跳 >> /var/log/cron 2>&1

#清空jenkins中的离线节点
result=`curl ${JENKINS_URL}/computer/api/json?pretty=true` 
length=`echo $result | /usr/local/bin/jq '.computer' | /usr/local/bin/jq 'length'`
for((i=0;i < $length;i++));
do
computer=`echo $result | /usr/local/bin/jq .computer[$i]`
offline=`echo $computer | /usr/local/bin/jq .offline`
beforeDisplayName=`echo $computer | /usr/local/bin/jq .displayName`
beforeDisplayNameLength=`expr length $beforeDisplayName`
afterDisplayNameLength=`expr $beforeDisplayNameLength - 2`
afterDisplayName=`expr substr $beforeDisplayName 2 $afterDisplayNameLength`
if [ $offline == true ];then  
    curl -X POST  ${JENKINS_URL}/computer/$afterDisplayName/doDelete; 	
	echo "删除$afterDisplayName" >> /var/log/cron 2>&1;
else
	echo "$afterDisplayName在线" >> /var/log/cron 2>&1;
fi;	
done
