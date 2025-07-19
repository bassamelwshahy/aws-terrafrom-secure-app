install_proxy.sh is #!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y
sudo systemctl enable nginx
sudo systemctl start nginx

# NGINX as reverse proxy
cat <<EOF | sudo tee /etc/nginx/nginx.conf
events {}
http {
  server {
    listen 80;
    location / {
      proxy_pass "${backend_url}";
    }
  }
}
EOF

sudo systemctl restart nginx                                                                                                         install_proxy.sh is    #!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd

#  Disable the default welcome page
sudo mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.bak

# Add custom content
echo "<h1>Welcome to ITI $(hostname)</h1>" | sudo tee /var/www/html/index.html

# Restart Apache to apply changes
sudo systemctl restart httpd