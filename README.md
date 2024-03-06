# Terraform Project: Nginx Cluster with Route53

This Terraform project sets up a load-balanced Nginx cluster within an AWS VPC, along with Route53 configuration for DNS resolution.

## Key Components

- **_VPC_**: A custom virtual private cloud with a dedicated subnet.
- **_Security Group_**: Configured to allow SSH (port 22), HTTP (port 80), and HTTPS (port 443) traffic.
- **_Nginx Instances_**: Three Ubuntu servers running Nginx (`nginx-server`, `nginx-web-server-1`, `nginx-web-server-2`).
- **_Route 53_**: A hosted zone for your domain, with an "A" record pointing to the Nginx servers (load balancing is assumed to be configured on the Nginx side).

## Prerequisites

- [Terraform](https://www.terraform.io/)
- AWS Account and credentials configured with sufficient permissions.

## Project Structure

- `vpc.tf`: Contains Terraform code for VPC, subnet, route table, and internet gateway creation.
- `instance.tf`: Provisions the Ubuntu instances, installs Nginx, and includes any necessary configuration.
- `route53.tf`: Creates the Route53 hosted zone and the "A" record.
- `output.tf`: Defines the outputs of the project (e.g., nameservers, public/private IPs).

## Getting Started

1. Clone this repository.
2. Update `instance.tf` with your desired Nginx configuration.
3. Set up AWS credentials (review Terraform documentation if unfamiliar).
4. Initialize Terraform: `terraform init`
5. Plan the changes: `terraform plan`
6. Apply the configuration: `terraform apply`

## Important Outputs

Refer to the `output.tf` file and the Terraform console output for:

- **_Name Servers_**: Values to update your domain registrar for Route53.
- **_Public IPs_**: Addresses of the Nginx servers.

## Customization

- Modify instance configurations, security group rules, and Nginx setup as needed.
- Consider adding load balancer configuration in front of the Nginx servers (not included in this basic setup).

> [!NOTE]
> - Replace placeholders like `[your-domain-name]` with your actual domain.
> - This assumes a basic working understanding of Terraform and AWS concepts.
