FROM qq275860560/base

MAINTAINER jiangyuanlin@163.com

# jenkins http://mirrors.jenkins-ci.org/war/latest/jenkins.war 
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo && \
  rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key && \
  yum -y  install  jenkins && yum -y update jenkins &&\
  yum clean all && rm -rf /var/cache/yum/* 

#/usr/lib/jenkins/：jenkins安装目录，war包会放在这里。
# /etc/sysconfig/jenkins：jenkins配置文件，“端口”，“JENKINS_HOME”等都可以在这里配置。
#/var/lib/jenkins/：默认的JENKINS_HOME。
#/var/log/jenkins/jenkins.log：jenkins日志文件。
#/etc/init.d/jenkins 添加java_home路径
#/etc/sysconfig/jenkins修改运行用户和端口

RUN  echo "export JENKINS_HOME=/var/lib/jenkins/" >> /etc/profile && source /etc/profile   &&\
      mkdir -pv /var/lib/jenkins/plugins/ && curl -L -o /var/lib/jenkins/plugins/git.hpi http://updates.jenkins-ci.org/latest/git.hpi &&\
      curl -L -o /var/lib/jenkins/plugins/git-client.hpi http://updates.jenkins-ci.org/latest/git-client.hpi &&\
      curl -L -o /var/lib/jenkins/plugins/scm-api.hpi http://updates.jenkins-ci.org/latest/scm-api.hpi &&\
      curl -L -o /var/lib/jenkins/plugins/ssh-credentials.hpi http://updates.jenkins-ci.org/latest/ssh-credentials.hpi &&\
      curl -L -o /var/lib/jenkins/plugins/credentials.hpi http://updates.jenkins-ci.org/latest/credentials.hpi &&\
      mkdir -p /var/lib/jenkins/.ssh &&  printf "Host * \nUserKnownHostsFile /dev/null \nStrictHostKeyChecking no" >> /var/lib/jenkins/.ssh/config 



 


#ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
RUN mkdir -pv /usr/share/jenkins/ref/ && curl  https://raw.githubusercontent.com/fabric8io/jenkins-docker/master/config/config.xml  -o /usr/share/jenkins/ref/config.xml &&\
    curl  https://raw.githubusercontent.com/Kong/jenkins/master/executors.groovy  -o /usr/share/jenkins/ref/init.groovy.d/executors.groovy &&\
    curl  https://raw.githubusercontent.com/fabric8io/jenkins-docker/master/config/load-properties.groovy  -o /usr/share/jenkins/ref/init.groovy.d/load-properties.groovy &&\
    echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state &&\
    curl  https://raw.githubusercontent.com/fabric8io/jenkins-docker/master/config/jenkins.properties  -o /usr/share/jenkins/ref/jenkins.properties &&\
    cd /usr/share/jenkins/ref/ && curl -O https://raw.githubusercontent.com/Kong/jenkins/master/plugins.txt  &&\
	/usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt  &&\
	cd /usr/share/jenkins/ref/ && curl -O https://raw.githubusercontent.com/fabric8io/jenkins-docker/master/plugins.txt  &&\
    /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

RUN	cd /etc/ && curl -O https://raw.githubusercontent.com/qq275860560/base/master/src/main/centos/etc/crontab  &&\
    cd /usr/local/bin/ && curl -O https://raw.githubusercontent.com/qq275860560/base/master/src/main/centos/usr/local/bin/deleteJenkinsAgent.sh
	
#CMD service sshd start ; service jenkins start ; bash	
	