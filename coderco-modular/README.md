# 🚀 CoderCo Azure Terraform Starter

## 🌍 Overview

Welcome to the **CoderCo Azure Terraform Starter**! This project demonstrates the deployment and management of infrastructure on **Microsoft Azure using Terraform**. The primary focus is on **Creating a Resource Group, Network Resources, Load Balancer, Virtual Machine Scale Set (VMSS), and Monitoring Resources, and finally deploying the infrastructure using Azure DevOps CI/CD.**.

## 📦 Project Structure

This repository contains Terraform code to:
- Debug and fix the initial Terraform configuration.
- Ensure successful deployment and accessibility of the application.
- Enhance scalability and high availability.
- Implement networking and security best practices.
- Adapt the solution to Linux-based VMs.
- Enforce Terraform best practices.

## 📌 Tasks Completed

### 🛠️ Debug & Fix the Configuration

- Fixed multiple syntax, provider, and logical errors.
- Configured Terraform state management using a remote backend.

### 🚀 Ensure Successful Deployment

- Resolved issues causing failures during `terraform apply`.
- Ensured the application deployed to the VM scale set is accessible via HTTP on port 80.
- Verified successful deployment with a response: "Hello! Your CoderCo Tech Test VM is working!"

### 📈 Scale & High Availability Enhancements

- Updated the VMSS to run 3 instances.
- Distributed instances across multiple Availability Zones for high availability.
- Configured automatic scaling for the VMSS.

### 🔒 Networking & Security Best Practices

- Upgraded to an Azure Application Load Balancer (ALB) to distribute traffic across VMSS nodes.
- Restricted unnecessary security group rules following the principle of least privilege.
- Configured Network Security Groups (NSGs) to allow only port 80 for HTTP traffic.
- Ensured data encryption at rest for storage resources.

### 🐧 Linux Compatibility

- Modified the solution to deploy Linux-based VMs.
- Ensured the application starts and serves traffic correctly on Linux.
- Used cloud-init to configure the VM on boot.

### 🏆 Terraform Best Practices

- Removed Terraform warnings and deprecations.
- Refactored the solution to follow the DRY principle:
  - Created modules for reusable components.
  - Defined variables for configurable parameters.
  - Created outputs to expose useful information.
  - Used locals to simplify expressions.
- Implemented Terraform linting to ensure code quality.
- Used Terraform locking and version pinning to prevent unintended updates.

### ⭐ Extra Credit

- Implemented logging and monitoring using Azure Monitor and Log Analytics.
- Stored Terraform state in an Azure Storage Account with state locking.
- Automated Terraform deployments using GitHub Actions.

## 🛠 Pre-Requisites

Ensure you have the following installed:
- **Azure CLI** (authenticated to your Azure subscription)
- **Terraform** (latest stable version)
- **jq** (for JSON parsing in CLI)

## 🚀 How to Apply the Terraform Configuration

1. Clone this repository.
- git clone https://github.com/yourusername/coderco-azure-terraform.git
- cd coderco-azure-terraform
- cd coderco-modular

2. Navigate to the project directory.
 - terraform init

3. Navigate to the project directory.
 - terraform plan

4. Apply the Terraform configuration:
- terraform apply

## 📄 Assumptions, Limitations, & Trade-offs
Assumed the use of an existing Azure subscription.

Focused on core tasks, with optional extra credit tasks for additional value.

Trade-offs made for simplicity and readability in code structure.
