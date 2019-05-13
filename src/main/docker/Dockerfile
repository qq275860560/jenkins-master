FROM qq275860560/base

MAINTAINER jiangyuanlin@163.com

# jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo && \
  rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key && \
  yum -y  install  jenkins &&\
  yum clean all && rm -rf /var/cache/yum/* 

#RUN  curl -L -o /tmp/git.hpi http://updates.jenkins-ci.org/latest/git.hpi
#RUN  curl -L -o /tmp/git-client.hpi http://updates.jenkins-ci.org/latest/git-client.hpi
#RUN  curl -L -o /tmp/scm-api.hpi http://updates.jenkins-ci.org/latest/scm-api.hpi
#RUN  curl -L -o /tmp/ssh-credentials.hpi http://updates.jenkins-ci.org/latest/ssh-credentials.hpi
#RUN  curl -L -o /tmp/credentials.hpi http://updates.jenkins-ci.org/latest/credentials.hpi

RUN cd /usr/share/jenkins/ref/init.groovy.d/ && curl -O https://raw.githubusercontent.com/Kong/jenkins/master/executors.groovy  &&\
    echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state &&\
    cd /usr/share/jenkins/ref/ && curl -O https://raw.githubusercontent.com/Kong/jenkins/master/plugins.txt  &&\
	/usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt


RUN	cd /etc/ && curl -O https://raw.githubusercontent.com/qq275860560/base/master/src/main/centos/etc/crontab  &&\
    cd /usr/local/bin/ && curl -O https://raw.githubusercontent.com/qq275860560/base/master/src/main/centos/usr/local/bin/deleteJenkinsAgent.sh
	
	
	