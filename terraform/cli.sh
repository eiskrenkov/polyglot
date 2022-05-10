# Installation
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# Initializing a configuration directory downloads and installs the providers defined in the configuration
terraform init

# Automatically update configurations in the current directory for readability and consistency
terraform fmt

# Make sure your configuration is syntactically valid and internally consistent
terraform validate

# Preview any changes before you applying them
terraform plan

# Makes the changes defined by Terraform configuration to create, update, or destroy resources
terraform apply -var 'some_variable=SomeValue'

# Inspect the current state (terraform.tfstate)
terraform show

# List of the resources in project's state
terraform state list

# Terminate resources managed by Terraform project (inverse of apply)
terraform destroy

# Get all outputs
terraform outputs

# Get specific output
terraform output some_output
