# CoderCo Azure Terraform Starter 🚀

## 🌍 Overview
This Terraform configuration deploys a scalable infrastructure on **Microsoft Azure**, including:

- **Virtual Machine Scale Sets (VMSS)** for automatic scaling of Ubuntu VMs.
- **Load Balancer (LB)** for high availability and distributing traffic to VMSS instances.
- **Network Security Group (NSG)** with rules allowing HTTP (port 80) and SSH (port 22).
- A simple **Apache web server** running on Ubuntu 22.04 LTS VMs that serves a test message.

## 🔧 Deployed Resources
- **Resource Group**: `coderco-tech-test`
- **Virtual Network**: `coderco-vnet` with a subnet `coderco-subnet`.
- **Public IP Address** for Load Balancer access.
- **Load Balancer**: Distributes HTTP traffic to VM instances.
- **Network Security Group (NSG)**: Configured to allow HTTP and SSH traffic.
- **Virtual Machine Scale Set (VMSS)**: 2 Ubuntu VMs running Apache, serving a "Hello! Your CoderCo Tech Test VM is working!" message.

## ⚙️ Key Features
### 1. **Load Balancer** 🔄
- Configured with a health probe to ensure traffic is only directed to healthy VMs.
- Frontend IP to route traffic from the public internet.

### 2. **VMSS** 🖥️
- Two Ubuntu VMs in a scale set.
- Auto-installs Apache with a simple web page upon VM boot.
- Integrated with the Load Balancer backend pool for traffic distribution.

### 3. **Security** 🔐
- **NSG** allows HTTP traffic (port 80) and SSH (port 22) to the VMs for management and application access.

## 🚀 Deployment Instructions

### 1. Initialize Terraform
```bash
terraform init
2. Review the Plan

terraform plan
3. Apply the Configuration

terraform apply
4. Access the Web Application 🌐
Once the deployment is complete, you can access the VM instances via the Load Balancer's public IP on HTTP port 80:


http://<public_ip>
You should see the message:


Hello! Your CoderCo Tech Test VM is working!

✅ Conclusion
This configuration provides a simple yet scalable infrastructure using Azure VMSS and Load Balancer, ensuring high availability and accessibility of your application.

📄 License
This project is licensed under the MIT License.