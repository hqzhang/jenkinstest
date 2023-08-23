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

To install and configure NGINX as a file server on CentOS, follow these steps:

Update System Packages:
Open a terminal and run the following commands to update your system's package repositories and upgrade existing packages:

bash
Copy code
sudo yum update
Install NGINX:
Install NGINX using the following command:

bash
Copy code
sudo yum install nginx
Start and Enable NGINX:
Start the NGINX service and enable it to start on system boot:

bash
Copy code
sudo systemctl start nginx
sudo systemctl enable nginx
Create a Directory for File Sharing:
Choose a directory on your system where you want to store the shared files. For example, let's create a directory named "files" under the NGINX web root directory:

bash
Copy code
sudo mkdir -p /usr/share/nginx/html/files
Set Permissions:
Set appropriate permissions for the directory so that NGINX can access and serve the files:

bash
Copy code
sudo chown -R nginx:nginx /usr/share/nginx/html/files
sudo chmod -R 755 /usr/share/nginx/html/files
Configure NGINX:
Create a new NGINX configuration file for the file sharing site. You can use a text editor like nano or vim to create the file:

bash
Copy code
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

bash
Copy code
sudo nginx -t
If the test is successful, reload NGINX to apply the new configuration:

bash
Copy code
sudo systemctl reload nginx
Upload Files:
You can now upload files to the /usr/share/nginx/html/files directory using methods like SCP, SFTP, or other file transfer protocols.

Access Shared Files:
Open a web browser and navigate to http://your_domain_or_server_ip/files to access the shared files.

Keep in mind that this basic configuration doesn't provide advanced security features. If you plan to use this file server in a production environment, consider implementing additional security measures like HTTPS, authentication, and access control.
