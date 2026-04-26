# AWS Auto Scaling Web Server

## Overview
This project demonstrates a self-healing, load-balanced web server environment on AWS.

I deployed EC2 instances using an Auto Scaling Group behind an Application Load Balancer. The instances were created from a Launch Template using a User Data script to automatically install Apache and serve a webpage showing instance metadata.

## Architecture
- Amazon EC2
- Application Load Balancer
- Target Group
- Auto Scaling Group
- Launch Template
- Security Groups
- Amazon Linux 2023
- Apache HTTP Server

## Features
- Automated EC2 setup using User Data
- Load balancing across multiple EC2 instances
- Multi-Availability Zone deployment
- Health checks using a Target Group
- Auto Scaling self-healing
- Dynamic webpage showing instance ID and Availability Zone

## How It Works
1. A Launch Template defines how EC2 instances are created.
2. The User Data script installs and starts Apache.
3. The Auto Scaling Group maintains the desired number of instances.
4. The Application Load Balancer distributes traffic across healthy instances.
5. If an instance is terminated, Auto Scaling automatically replaces it.

## Testing
To test self-healing, I manually terminated one EC2 instance.  
After a few minutes, the Auto Scaling Group launched a replacement instance automatically.

## User Data Script
See [`user-data.sh`](./user-data.sh).

## Screenshots
Add screenshots showing:
- EC2 instances created by the Auto Scaling Group
- Target Group with healthy targets
- Load Balancer DNS working in the browser
- Instance replacement after termination

## What I Learned
- How to deploy EC2 instances automatically
- How to configure an Application Load Balancer
- How Target Groups and health checks work
- How Auto Scaling Groups provide self-healing infrastructure
- How to use EC2 metadata with IMDSv2
