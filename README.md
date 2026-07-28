# AWS_VPC — Terraform

A small AWS environment with Terraform: a VPC with public and private subnets, networking (IGW, NAT Gateway, route tables, NACLs, security groups), and two EC2 instances (Windows in the public subnet, Linux in the private subnet) with SSH/RDP access and a Reachability Analyzer connectivity test.

## Architecture

- **VPC** with one public and one private subnet
- **Public subnet** → Internet Gateway (Windows instance, publicly reachable via RDP)
- **Private subnet** → NAT Gateway for outbound access (Linux instance, no public IP)
- **Reachability Analyzer** verifies connectivity from the Windows instance to the Linux instance
  
## Files

| File | Purpose |
|------|---------|
| `providers.tf` | AWS provider, region, and Terraform version constraints |
| `variables.tf` | Input variables (CIDRs, AMIs, instance types) |
| `data.tf` | Fetches your public IP to scope security group rules |
| `random.tf` | Random values for unique resource names |
| `keys.tf` | Generates an RSA key pair for SSH/RDP access |
| `vpc.tf` | VPC, public subnet, private subnet |
| `rt.tf` | Route tables (public → IGW, private → NAT Gateway) |
| `eip.tf` | Elastic IPs for the NAT Gateway and Windows instance |
| `gateway.tf` | Internet Gateway and NAT Gateway |
| `sg.tf` | Security groups (Windows: RDP/HTTP/HTTPS, Linux: SSH/MySQL) |
| `nacl.tf` | Network ACLs for the public and private subnets |
| `windows.tf` | Windows EC2 instance (public subnet) |
| `linux.tf` | Linux EC2 instance (private subnet) |
| `rdp.tf` | Generates an `.rdp` file for connecting to the Windows instance |
| `network_insights.tf` | Reachability Analyzer test for connectivity |
| `output.tf` | Outputs: IPs, resource IDs, Windows password, reachability results |
| `vpc.dot` / `vpc.svg` | Graph visualization of the resource dependencies |

## Usage

```bash
terraform init
terraform plan
terraform apply
```

Tear everything down when finished:

```bash
terraform destroy
```

## Visualizing the graph

`vpc.dot` and `vpc.svg` are the resource dependency graph. To regenerate:

```bash
terraform graph > vpc.dot
dot -Tsvg vpc.dot -o vpc.svg   # requires Graphviz
```

## Notes

- **NAT Gateway and Elastic IPs incur hourly costs** — run `terraform destroy` when you're done experimenting.
