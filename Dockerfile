FROM jenkins/jenkins:lts-jdk11
MAINTAINER   VinothKumar P <vinothkumar.P@Yahoo.com>
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false


COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli --plugins "blueocean:1.25.6 docker-workflow:1.29"
USER root
RUN yum install docker
RUN yum install py-pip

USER jenkins
