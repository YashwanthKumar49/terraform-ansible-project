# terraform-ansible-project

🚀 A complete end-to-end automation setup using "Terraform" to provision AWS EC2 infrastructure and "Ansible" to configure it — including installing Apache HTTP Server.

---

# 🧰 Tools Used

- **Terraform** – Infrastructure as Code (IaC)
- **Ansible** – Configuration Management
- **AWS EC2** – Cloud compute resources
- **WSL Ubuntu** – Development environment

---

# 🌐 Project Structure

terraform-ansible-project/
├── terraform/
│ └── main.tf # Terraform to provision EC2, SG, SSH key
└── ansible/
├── inventory # IP auto-written by Terraform
└── playbook.yml # Installs Apache on provisioned EC2


---

# 🔧 Prerequisites

- ✅ Terraform & Ansible installed in WSL Ubuntu
- ✅ AWS CLI configured via `aws configure`
- ✅ SSH key pair created at `~/.ssh/my-key` and uploaded to AWS
- ✅ AWS Free Tier account

---

# 🚀 How to Run

 Step 1: Provision EC2 with Terraform
```bash
cd terraform-ansible-project/terraform
terraform init
terraform apply
✅ This launches an EC2 instance and writes the public IP to ansible/inventory.

Step 2: Install Apache with Ansible
bash
Copy
Edit
cd ../ansible
ansible-playbook -i inventory playbook.yml \
  --private-key ~/.ssh/my-key \
  -u ubuntu
✅ Apache2 will be installed on the EC2 instance.

Step 3: Verify Apache
Open a browser:

cpp
Copy
Edit
http://<EC2-PUBLIC-IP>
You should see the Apache2 Ubuntu Default Page 🎉

🔐 Security Best Practices
Lock down Security Group to your IP (not 0.0.0.0/0)

Use environment variables for AWS credentials

Never commit .terraform/ or private keys

🛠 Future Improvements
🔁 Use Terraform output blocks instead of local-exec

🗃 Use Ansible roles

🌩️ Automate via Spacelift or GitHub Actions

🧪 Add app deployment on top of Apache

