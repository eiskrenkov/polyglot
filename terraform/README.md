# Resources
- [https://learn.hashicorp.com/](https://learn.hashicorp.com/)
- [https://www.terraform.io/language](https://www.terraform.io/language)

# Common

## State
When applying the configuration, Terraform writes data into a file called `terraform.tfstate`. Terraform stores the IDs
and properties of the resources it manages in this file, so that it can update or destroy those resources going forward

## Variables
Terraform loads all .tf files from the directory, so variables file can have any name, e.g `variables.tf`

Example:

`variables.tf`
```hcl
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}
```

Usage:

`main.tf`
```hcl
resource "aws_instance" "app_server" {
   ami           = "ami-08d70e59c07c61a3a"
   instance_type = "t2.micro"

   tags = {
     Name = var.instance_name
   }
 }
```

To override, run apply with `-var`: `terraform apply -var "instance_name=YetAnotherName"`

## Outputs

Example:
`outputs.tf`
```hcl
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}
```

Run `terraform outputs` to get all outputs
`terraform output instance_id` to get specific output

# Style conventions

- Indent two spaces for each nesting level.

- When multiple arguments with single-line values appear on consecutive lines at the same nesting level, align their
  equals signs

```hcl
ami           = "abc123"
instance_type = "t2.micro"
```

- When both arguments and blocks appear together inside a block body, place all of the arguments together at the top
  and then place nested blocks below them. Use one blank line to separate the arguments from the blocks.

- Use empty lines to separate logical groups of arguments within a block.

- For blocks that contain both arguments and "meta-arguments" (as defined by the Terraform language semantics),
  list meta-arguments first and separate them from other arguments with one blank line. Place meta-argument blocks last
  and separate them from other blocks with one blank line.

```hcl
resource "aws_instance" "example" {
  count = 2 # meta-argument first

  ami           = "abc123"
  instance_type = "t2.micro"

  network_interface {
    # ...
  }

  lifecycle { # meta-argument block last
    create_before_destroy = true
  }
}
```

- Top-level blocks should always be separated from one another by one blank line. Nested blocks should also be separated
  by blank lines, except when grouping together related blocks of the same type (like multiple provisioner blocks in a
  resource).

- Avoid separating multiple blocks of the same type with other blocks of a different type, unless the block types are
  defined by semantics to form a family. (For example: root_block_device, ebs_block_device and ephemeral_block_device
  on aws_instance form a family of block types describing AWS block devices, and can therefore be grouped together
  and mixed.)
