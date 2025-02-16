# 🚀 CoderCo Azure Starter

## 🌍 Overview

Welcome to the **CoderCo Azure Terraform Starter**! This technical assessment is designed to evaluate your ability to deploy and manage infrastructure on **Microsoft Azure using Terraform**. The primary focus is on **Virtual Machine Scale Sets (VMSS), high availability, and best practices**.

The provided Terraform configuration contains multiple errors and incomplete features. Your task is to **debug, improve, and extend the solution** following **Terraform best practices**.

No direct SSH or RDP access is required, but you can enable access for troubleshooting if necessary. Feel free to tackle the tasks in any order, and remember, you are **not expected to complete all tasks** within the given time.

## 🛠 Pre-Requisites

Ensure you have the following installed:

- ✅ **Azure CLI** (authenticated to your Azure subscription)
- ✅ **Terraform** (latest stable version)
- ✅ **jq** (for JSON parsing in CLI)

## 📌 Tasks

### 🛠 Debug & Fix the Configuration

- 🔍 The supplied Terraform code contains multiple **syntax, provider, and logical errors**.
- 🛠 Fix the errors to ensure `terraform plan` runs successfully.
- ☁️ Ensure **Terraform state management** is configured properly (**use remote backend** where applicable).

### 🚀 Ensure Successful Deployment

- 🛑 The current configuration **fails during apply**. Identify and fix the issues.
- 🌐 Ensure the application deployed to the VM scale set is **accessible via HTTP on port 80**.
- ✅ Test by retrieving the **public IP** and verifying a response like:
  
"Hello! Your CoderCo Tech Test VM is working!"

### 📈 Scale & High Availability Enhancements

- 📊 Update the **Virtual Machine Scale Set (VMSS)** to run **3 instances**.
- 🌍 Distribute instances across **multiple Availability Zones** for high availability.
- 📌 Ensure **automatic scaling** is configured correctly.

### 🔒 Networking & Security Best Practices

- ⚖️ **Upgrade to an Azure Application Load Balancer (ALB)** to distribute traffic across VMSS nodes.
- 🔐 Ensure the infrastructure follows **principle of least privilege** by restricting unnecessary security group rules.
- 🔄 Configure **network security groups (NSGs)** to allow only **port 80 for HTTP traffic**.
- 🔑 Ensure **data encryption at rest** for any storage resources.

### 🐧 Make the Solution Linux-Compatible

- 🔄 The current solution is Windows-based. Modify it to deploy **Linux-based VMs** instead.
- 🚀 Ensure the application starts and serves traffic correctly on Linux.
- ⚙️ Use **cloud-init or Terraform provisioners** to configure the VM on boot.

### 🏆 Enforce Terraform Best Practices

- 🚨 Remove any **Terraform warnings and deprecations**.
- ♻️ Refactor the solution to follow the **DRY (Don't Repeat Yourself) principle** using:
- 📦 **Modules** for reusable components.
- 🎛️ **Variables** for configurable parameters.
- 📤 **Outputs** to expose useful information.
- 📌 **Locals** to simplify expressions.
- 🔍 Implement **Terraform linting** to ensure code quality.
- 🔒 Use **Terraform locking and version pinning** to prevent unintended updates.

### ⭐ Extra Credit

- 📊 Implement **logging and monitoring** using Azure Monitor and Log Analytics.
- 🔐 Store Terraform state in an **Azure Storage Account with state locking**.
- 🚀 Automate Terraform deployments using **CI/CD pipelines (GitHub Actions, Azure DevOps)**.

---

## 📩 Submission Guidelines

- 📂 Provide a **GitHub repository** with your Terraform code and documentation.
- 📜 Include a **README.md** with instructions on how to apply the Terraform configuration.
- 📝 Document any **assumptions, limitations, or trade-offs** you made.
- 🔧 If using modules, structure your code following a **clean, modular approach**.

**All the best!** 🚀

## 🔖 Version Details

**Version:** 1.0