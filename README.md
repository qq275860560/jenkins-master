[TOC]
jenkins主节点镜像

# 适用场景
适用于开发测试环境

# 功能
## 配置jenkins账号密码
## 更新jenkins的常用插件
## 自动删除离线从节点

# 使用方式
```
docker pull qq275860560/jenkins-master
(docker kill jenkins-master || true) && (docker rm jenkins-master || true) 
docker run -d -p 8080:8080 --name jenkins-master qq275860560/jenkins-master 

```

或者

```
docker pull qq275860560/jenkins-master
(docker kill jenkins-master || true) && (docker rm jenkins-master || true) 
docker run -it -p 8080:8080 --name jenkins-master qq275860560/jenkins-master /bin/bash

# 容器内执行
source /etc/profile &&\
    /usr/sbin/sshd &&\
    /etc/rc.d/init.d/jenkins start && tail -f /var/log/lastlog 		

```

# 温馨提醒

* 此项目将会长期维护，增加或改进实用的功能
* 右上角点击star，给我继续前进的动力,谢谢