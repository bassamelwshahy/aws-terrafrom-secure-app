


<img width="757" height="389" alt="project" src="https://github.com/user-attachments/assets/142a5d93-6e73-4905-852c-8f145a29b4f8" />









# 🔐 Secure Web App on AWS using Terraform

This project builds a secure and scalable web application architecture on AWS using Terraform modules. It uses private/public subnets, reverse proxies, and application load balancers to simulate a production-grade setup.

## 📊 Architecture Overview

- **Public Subnet**
  - 2x EC2 NGINX Reverse Proxy Instances
  - Public ALB for external traffic

- **Private Subnet**
  - 2x EC2 Backend Instances (App server)
  - Internal ALB for traffic distribution from proxies

- **Networking**
  - VPC with public/private subnets across 2 AZs
  - NAT Gateway (for backend EC2s outbound access)
  - Internet Gateway (for public ALB & proxies)

- **Security**
  - Isolated backend in private subnets
  - Security Groups restrict access between layers

- **Automation**
  - Remote-exec and file provisioners for EC2 setup
  - `local-exec` for SSH key generation
  - Terraform remote state and outputs used effectively

## 🧱 Modules Used

- `vpc` — Creates the VPC, subnets, gateways, routing
- `security_groups` — Creates SGs for proxies and backends
- `ec2_proxy` — Launches and provisions NGINX instances
- `ec2_backend` — Launches and provisions backend EC2s
- `alb` — Creates public/internal ALBs and target groups

## 🛠️ Requirements

- Terraform >= 1.0
- AWS CLI configured with valid credentials
- SSH access to EC2s (via keys generated in provisioning step)

## 🚀 Usage


# Clone the repo
git clone https://github.com/bassamelwshahy/aws-terrafrom-secure-app.git
cd aws-terrafrom-secure-app

# Initialize and apply
terraform init
terraform plan
terraform apply

aws-terrafrom-secure-app/
├── main.tf
├── backend.tf
├── variables.tf
├── outputs.tf
├── install_proxy.sh
├── install_backend.sh
├── modules/
    ├── network/
    ├── security/
    ├── ec2_proxy/
    ├── ec2_backend/
    └── load_balancer/

