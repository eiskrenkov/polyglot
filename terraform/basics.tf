# Basic block

resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}

# <BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
#   # Block body
#   <IDENTIFIER> = <EXPRESSION> # Argument
# }

# Blocks are containers for other content and usually represent the configuration of some kind of object, like a
# resource. Blocks have a block type, can have zero or more labels, and have a body that contains any number of
# arguments and nested blocks. Most of Terraform's features are controlled by top-level blocks in a configuration file.
# Arguments assign a value to a name. They appear within blocks. Expressions represent a value, either literally
# or by referencing and combining other values. They appear as values for arguments, or within other expressions.
