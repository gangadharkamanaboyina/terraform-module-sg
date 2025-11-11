# Terraform AWS Security Group (SG) Module

This Terraform module creates an AWS Security Group (SG) with dynamic ingress and egress rules.  
It is reusable, environment-agnostic, and designed following AWS & Terraform best practices.

---

## 🚀 Features

- Creates a Security Group in a specified VPC  
- Supports multiple ingress and egress ports  
- Uses dynamic blocks for flexibility  
- Allows merging custom tags  
- Follows naming convention: <project>-<env>-sg  
- Outputs SG ID for easy reference in other modules (e.g., EC2, ALB, RDS)

---

## 🧩 Example Usage

```hcl
module "sg" {
  source = "github.com/gangadharkamanaboyina/terraform-module-sg"

  project = "roboshop"
  env     = "dev"
  vpc_id  = module.vpc.vpc_id

  ingress_ports = [22, 80, 8080]
  egress_ports  = [0]

  tags = {
    Owner  = "Gangadhar"
    App    = "Roboshop"
    Module = "SecurityGroup"
  }
}
```

---

## 🔧 Inputs

| Name | Type | Default | Description |
|------|------|----------|-------------|
| project | string | n/a | Project name for tagging and naming |
| env | string | n/a | Environment name (e.g., dev, stage, prod) |
| vpc_id | string | n/a | The VPC ID where the SG will be created |
| ingress_ports | list(number) | [] | List of ingress ports to allow |
| egress_ports | list(number) | [0] | List of egress ports (default: all) |
| tags | map(string) | {} | Additional resource tags |

---

## 📤 Outputs

| Name | Description |
|------|-------------|
| sg_id | The ID of the created Security Group |

---

## 🧱 Resources Created

- aws_security_group
- aws_security_group_rule (via dynamic ingress & egress)

---

## 🧠 Notes

- Default egress allows all outbound traffic (0.0.0.0/0)  
- For restricted environments, customize the egress_ports variable  
- Ingress and egress ports are handled dynamically — simply update the lists  

---

## 🧰 Example Output

```
sg_id = "sg-0a1b2c3d4e5f6g7h"
```

---

## 👨‍💻 Author

**Gangadhar Kamanaboyina**  
AWS | Terraform | DevOps Engineer  
🔗 [GitHub Repository](https://github.com/gangadharkamanaboyina/terraform-module-sg)

---

## 🏷️ Tags

#Terraform #AWS #DevOps #InfrastructureAsCode #SecurityGroup #Cloud #Automation #IaC
