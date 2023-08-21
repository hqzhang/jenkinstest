Install Jenkins Offline
1) download war
wget https://updates.jenkins.io/download/war/2.401.3/jenkins.war
2) download plugins
   downloadPlug.sh
3) download update
  wget https://updates.jenkins.io/update-center.json
4)
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.20.0.8-1.el7_9.x86_64
export JRE_HOME=/usr/lib/jvm/jre-11-openjdk-11.0.20.0.8-1.el7_9.x86_64
