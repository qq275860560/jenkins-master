FROM qq275860560/base

MAINTAINER jiangyuanlin@163.com

# jenkins
RUN curl -fsSL https://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/2.60.3/jenkins-war-2.60.3.war -o /usr/share/jenkins/jenkins.war &&\
	cd /etc/ && curl -O https://raw.githubusercontent.com/qq275860560/base/master/src/main/centos/etc/crontab  &&\
    cd /usr/local/bin/ && curl -O https://raw.githubusercontent.com/qq275860560/base/master/src/main/centos/usr/local/bin/deleteJenkinsAgent.sh
	