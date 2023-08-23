Install Jenkins Offline

1. yum install java-11-openjdk-devel
or 


sudo systemctl stop jenkins

1. Install OpenJDK
yum install java-11-openjdk-devel

1) rpm -iv 

Move the existing Jenkins data to the new location:
sudo rsync -av /root/.jenkins/ /home/hognqi/.jenkins/

Change the ownership of the new jenkins_home directory:
sudo chown -R hongqi:hongqi /home/username/.jenkins


Update the Jenkins configuration to use the new jenkins_home directory:


sudo vim /etc/sysconfig/jenkins 
Set JENKINS_HOME="/home/hongqi/.jenkins"


Start the Jenkins service again:

sudo systemctl start jenkins
1) download war
wget https://updates.jenkins.io/download/war/2.401.3/jenkins.war
2) download plugins
   downloadPlug.sh
3) download update
  wget https://updates.jenkins.io/update-center.json
4)
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.20.0.8-1.el7_9.x86_64
export JRE_HOME=/usr/lib/jvm/jre-11-openjdk-11.0.20.0.8-1.el7_9.x86_64

To install and configure JENKINS
To install Jenkins and configure the jenkins_home directory as /home/username/.jenkins on CentOS, follow these steps:

Install Java:
Jenkins requires Java to run. Install Java using the following command:

sudo yum install java-11-openjdk-devel
Add Jenkins Repository:
Add the Jenkins repository to your system:

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

Install Jenkins:
Install Jenkins using the following commands:
sudo yum install jenkins

Start and Enable Jenkins:
Start the Jenkins service and enable it to start on system boot:
sudo systemctl start jenkins
sudo systemctl enable jenkins

Configure Firewall:
If you have a firewall enabled, allow HTTP traffic on port 8080 (Jenkins default port):
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --reload

Access Jenkins Web Interface:
Open a web browser and navigate to http://your_server_ip:8080. You will see the Jenkins setup wizard.

Unlock Jenkins:
Retrieve the initial admin password from the Jenkins server using the following command:
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
Copy the password and paste it into the Jenkins setup wizard in your browser.

Install Plugins:
In the setup wizard, choose the "Install suggested plugins" option to install the recommended plugins. This will provide you with a basic set of plugins to start with.

Create an Admin User:
Fill in the required information to create an admin user for Jenkins.

Jenkins Home Configuration:
By default, Jenkins stores its data in the /var/lib/jenkins directory. To configure jenkins_home as /home/username/.jenkins, follow these steps:

Stop the Jenkins service:
sudo systemctl stop jenkins
Move the existing Jenkins data to the new location:
sudo rsync -av /var/lib/jenkins/ /home/username/.jenkins/

Change the ownership of the new jenkins_home directory:
sudo chown -R username:username /home/username/.jenkins

Update the Jenkins configuration to use the new jenkins_home directory:
sudo nano /etc/sysconfig/jenkins
Modify the JENKINS_HOME line to point to the new directory:

JENKINS_HOME="/home/username/.jenkins"

Start the Jenkins service again:
sudo systemctl start jenkins
Access Jenkins Dashboard:
After the Jenkins service starts, you can access the Jenkins dashboard at http://your_server_ip:8080. Log in with the admin credentials you created earlier.

Your Jenkins instance is now installed and configured with the jenkins_home directory located at /home/username/.jenkins. Remember that Jenkins stores its configuration, jobs, and other data in this directory, so make sure to back it up regularly.


To install and configure NGINX as a file server on CentOS, follow these steps:

Update System Packages:
Open a terminal and run the following commands to update your system's package repositories and upgrade existing packages:

sudo yum update
Install NGINX:
Install NGINX using the following command:

sudo yum install nginx
Start and Enable NGINX:
Start the NGINX service and enable it to start on system boot:

sudo systemctl start nginx
sudo systemctl enable nginx
Create a Directory for File Sharing:
Choose a directory on your system where you want to store the shared files. For example, let's create a directory named "files" under the NGINX web root directory:

sudo mkdir -p /usr/share/nginx/html/files
Set Permissions:
Set appropriate permissions for the directory so that NGINX can access and serve the files:

sudo chown -R nginx:nginx /usr/share/nginx/html/files
sudo chmod -R 755 /usr/share/nginx/html/files
Configure NGINX:
Create a new NGINX configuration file for the file sharing site. You can use a text editor like nano or vim to create the file:


sudo nano /etc/nginx/conf.d/file-server.conf
Add the following content to the configuration file:

nginx
Copy code
server {
    listen 80;
    server_name your_domain_or_server_ip;
    root /usr/share/nginx/html;

    location /files {
        autoindex on;
    }
}
Replace your_domain_or_server_ip with your actual domain name or server's IP address.

Test and Reload NGINX:
Test the NGINX configuration for any syntax errors:

sudo nginx -t
If the test is successful, reload NGINX to apply the new configuration:

sudo systemctl reload nginx
Upload Files:
You can now upload files to the /usr/share/nginx/html/files directory using methods like SCP, SFTP, or other file transfer protocols.

Access Shared Files:
Open a web browser and navigate to http://your_domain_or_server_ip/files to access the shared files.

Keep in mind that this basic configuration doesn't provide advanced security features. If you plan to use this file server in a production environment, consider implementing additional security measures like HTTPS, authentication, and access control.
