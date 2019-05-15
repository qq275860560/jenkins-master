FROM qq275860560/base

MAINTAINER jiangyuanlin@163.com

# jenkins http://mirrors.jenkins-ci.org/war/latest/jenkins.war 
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo && \
    rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key && \
    yum -y  install  jenkins && yum -y update jenkins &&\
    yum -y clean all && rm -rf /var/cache/yum/*  /tmp/* /var/tmp/*

#/usr/lib/jenkins/：jenkins安装目录，war包会放在这里。
#/etc/sysconfig/jenkins：jenkins配置文件，“端口”，“JENKINS_HOME”等都可以在这里配置。
#/var/lib/jenkins/：默认的JENKINS_HOME。
#/var/log/jenkins/jenkins.log：jenkins日志文件。
#/etc/init.d/jenkins 添加java_home路径
#/etc/sysconfig/jenkins修改运行用户和端口

# 去除启动向导
RUN  echo 'export JAVA_OPTS="$JAVA_OPTS -Djenkins.install.runSetupWizard=false"'   >> /etc/profile && source /etc/profile   &&\
     mkdir -pv /var/lib/jenkins/init.groovy.d/ && curl  https://raw.githubusercontent.com/qq275860560/jenkins-master/master/src/main/centos/var/lib/jenkins/init.groovy.d/basic-security.groovy

# 设置admin密码为123456
#RUN service jenkins start &&\
#    sleep 60s &&\
#    cd /var/cache/jenkins/war/WEB-INF/ &&\
#    pass=`cat /var/lib/jenkins/secrets/initialAdminPassword` &&\
#    echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("admin", "123456")' | java -jar jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy =

# 初始化

#RUN  echo "export JENKINS_HOME=/var/lib/jenkins/" >> /etc/profile && source /etc/profile   &&\
#      mkdir -p /var/lib/jenkins/.ssh &&  printf "Host * \nUserKnownHostsFile /dev/null \nStrictHostKeyChecking no" >> /var/lib/jenkins/.ssh/config 
#RUN mkdir -pv /usr/share/jenkins/ref/ && curl  https://raw.githubusercontent.com/fabric8io/jenkins-docker/master/config/config.xml  -o /usr/share/jenkins/ref/config.xml &&\
#    mkdir -pv /usr/share/jenkins/ref/init.groovy.d/ && curl  https://raw.githubusercontent.com/Kong/jenkins/master/executors.groovy  -o /usr/share/jenkins/ref/init.groovy.d/executors.groovy &&\
#    curl  https://raw.githubusercontent.com/fabric8io/jenkins-docker/master/config/load-properties.groovy  -o /usr/share/jenkins/ref/init.groovy.d/load-properties.groovy &&\
#    echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state &&\
#    curl  https://raw.githubusercontent.com/fabric8io/jenkins-docker/master/config/jenkins.properties  -o /usr/share/jenkins/ref/jenkins.properties

# 安装常用插件
RUN   mkdir -pv /var/lib/jenkins/plugins/ && cd /var/lib/jenkins/plugins/ &&\
      curl -O http://updates.jenkins-ci.org/latest/git.hpi &&\
      curl -O http://updates.jenkins-ci.org/latest/git-client.hpi &&\
      curl -O http://updates.jenkins-ci.org/latest/scm-api.hpi &&\
      curl -O http://updates.jenkins-ci.org/latest/ssh-credentials.hpi &&\
      curl -O http://updates.jenkins-ci.org/latest/credentials.hpi

#RUN cd /usr/local/bin/ &&\
#    curl -O https://raw.githubusercontent.com/jenkinsci/docker/master/install-plugins.sh && chmod +x /usr/local/bin/install-plugins.sh &&\
#    curl -O https://raw.githubusercontent.com/jenkinsci/docker/587b2856cd225bb152c4abeeaaa24934c75aa460/plugins.sh && chmod +x /usr/local/bin/plugins.sh &&\
#    curl -O https://raw.githubusercontent.com/jenkinsci/docker/587b2856cd225bb152c4abeeaaa24934c75aa460/jenkins-support && chmod +x /usr/local/bin/jenkins-support &&\
#    curl -O https://raw.githubusercontent.com/jenkinsci/docker/587b2856cd225bb152c4abeeaaa24934c75aa460/jenkins.sh && chmod +x /usr/local/bin/jenkins.sh
#   echo "export JENKINS_UC=https://updates.jenkins.io" >> /etc/profile && source /etc/profile   &&\
#   echo "export JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental" >> /etc/profile && source /etc/profile   &&\
#   cd /usr/share/jenkins/ref/ && curl -O https://raw.githubusercontent.com/Kong/jenkins/master/plugins.txt  &&\
#	/usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt  &&\
#	cd /usr/share/jenkins/ref/ && curl -O https://raw.githubusercontent.com/fabric8io/jenkins-docker/master/plugins.txt  &&\
#   /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# 定时任务
#RUN cd /etc/ && curl -O https://raw.githubusercontent.com/qq275860560/base/master/src/main/centos/etc/crontab  &&\
#    cd /usr/local/bin/ && curl -O https://raw.githubusercontent.com/qq275860560/base/master/src/main/centos/usr/local/bin/deleteJenkinsAgent.sh
	
#CMD service sshd start ; service jenkins start ; bash	

 
