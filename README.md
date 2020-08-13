# IaC in Action

> Reading material and code examples

## Table of Contents

- [IaC in Action](#code-all-the-things-terraform-x-aws)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Reading material](#reading-material)
    - [HashiCorp Configuration Language](#hashicorp-configuration-language)
  - [First Steps](#first-steps)
    - [Providers for Terraform](#providers-for-terraform)
    - [AWS-specific Terraform Resources](#aws-specific-terraform-resources)
    - [Other Terraform Resources](#other-terraform-resources)
    - [Outputs](#outputs)
  - [Next Steps](#next-steps)
    - [Code Quality](#code-quality)
    - [Modules](#modules)
  - [Author Information](#author-information)
  - [License](#license)

## Prerequisites

As part of this workshop, you will be using [HashiCorp Terraform](https://www.terraform.io) and [Amazon Web Services](https://aws.amazon.com).

For instructions on how to install Terraform. please see our [Learn Guide](https://learn.hashicorp.com/terraform/getting-started/install.html).

On that page, you will find instructions for macOS (using `brew`), Windows (using `choco`) as well as a manual installation path.

## Reading material

This section is a collection of links that will help you make the most of today's session.

### HashiCorp Configuration Language

- repository: [hashicorp/hcl](https://github.com/hashicorp/hcl/tree/hcl2)
- intermediate HCL: [Configuration Languages in HCL2](https://www.hashicorp.com/resources/intermediate-hcl-configuration-languages-in-hcl2/)

## First Steps

- CLI commands [terraform.io/docs/commands/index.html](https://www.terraform.io/docs/commands/index.html)
- variables and type constraints: [terraform.io/docs/configuration/variables.html](https://www.terraform.io/docs/configuration/variables.html#type-constraints)
- variable definition files: [terraform.io/docs/configuration/variables.html](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
- information about Terraform State: [terraform.io/docs/state/index.html](https://www.terraform.io/docs/state/index.html)

### Providers for Terraform

We used the following Providers for this workshop:

- `tls` Provider: [terraform.io/docs/providers/tls](https://www.terraform.io/docs/providers/tls/index.html)
- `local` Provider: [terraform.io/docs/providers/local](https://www.terraform.io/docs/providers/local/index.html)
- `http` Provider: [terraform.io/docs/providers/http](https://www.terraform.io/docs/providers/http/index.html)
- `aws` Provider: [terraform.io/docs/providers/aws](https://www.terraform.io/docs/providers/aws/index.html)

### AWS-specific Terraform Resources

We used the following AWS-specific Data Sources and Resources for this workshop:

- Data Source `aws_vpc`: [terraform.io/docs/providers/aws/d/vpc.html](https://www.terraform.io/docs/providers/aws/d/vpc.html)
- Resource `aws_security_group`: [terraform.io/docs/providers/aws/r/security_group.html](https://www.terraform.io/docs/providers/aws/r/security_group.html)
- Resource `aws_security_group_rule`: [terraform.io/docs/providers/aws/r/security_group_rule.html](https://www.terraform.io/docs/providers/aws/r/security_group_rule.html)
- Resource `aws_key_pair`: [terraform.io/docs/providers/aws/r/key_pair.html](https://www.terraform.io/docs/providers/aws/r/key_pair.html)
- Resource `aws_instance`: [terraform.io/docs/providers/aws/r/instance.html](https://www.terraform.io/docs/providers/aws/r/instance.html)
- Resource `aws_ebs_volume`: [terraform.io/docs/providers/aws/r/ebs_volume.html](https://www.terraform.io/docs/providers/aws/r/ebs_volume.html)
- Resource `aws_volume_attachment`: [terraform.io/docs/providers/aws/r/volume_attachment.html](https://www.terraform.io/docs/providers/aws/r/volume_attachment.html)
- Resource `aws_s3_bucket` [terraform.io/docs/providers/aws/r/s3_bucket.html](https://www.terraform.io/docs/providers/aws/r/s3_bucket.html)

### Other Terraform Resources

We used the following Data Sources and Resources for this workshop:

- Resource `tls_private_key`: [terraform.io/docs/providers/tls/r/private_key.html](https://www.terraform.io/docs/providers/tls/r/private_key.html)
- Resource `local_file`: [terraform.io/docs/providers/local/r/file.html](https://www.terraform.io/docs/providers/local/r/file.html)
- Data Source `http`: [terraform.io/docs/providers/http/data_source.html](https://www.terraform.io/docs/providers/http/data_source.html)

### Outputs

After running `terraform plan -out=aws.tfplan` and `terraform apply aws.tfplan`, you will have two resources:

- an EC2 Instance (see [AWS Console](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1))
- an S3 Bucket with Website Hosting (see [AWS Console](https://console.aws.amazon.com/s3/home?region=us-east-1))

For both of these, we have created [Terraform Outputs](https://www.terraform.io/docs/configuration/outputs.html) that can be retrevied using the [output Command](https://www.terraform.io/docs/commands/output.html):

```sh
# show all outputs
terraform output

# show SSH connection string for EC2 Instance
terraform output ssh_connection_string

# show Website Endpoint for S3 Bucket
terraform output website_url
```

- The SSH Connection String can be used to connect to your EC2 Instance. This uses the `ec2-ssh-key.pem` file.
- The Website Endpoint can be used to view S3-Bucket hosted website files for static websites.=

## Next Steps

- Learn Guide: Build infrastructure [learn.hashicorp.com/terraform/getting-started/build](https://learn.hashicorp.com/terraform/getting-started/build)
- Build your own AMIs with Packer: [packer.io/docs/builders/amazon/](https://www.packer.io/docs/builders/amazon/)

### Code Quality

Before `plan` and `apply`, always clean up your code:

- use [terraform fmt](https://www.terraform.io/docs/commands/fmt.html) to rewrite Terraform configuration files to a canonical format and style.
- use [terraform validate](https://www.terraform.io/docs/commands/validate.html) to validate the configuration syntax and internal consistency
- use [pre-commit](https://pre-commit.com) to run more checks
  - community member [@antonbabenko](https://github.com/antonbabenko/) built and maintains [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)

### Modules

- use modules as building blocks
- module documentation: [terraform.io/docs/configuration/modules.html](https://www.terraform.io/docs/configuration/modules.html)
- module registry: [registry.terraform.io](https://registry.terraform.io)
- Learn Guide: Modules on [learn.hashicorp.com/terraform/modules/modules-overview](https://learn.hashicorp.com/terraform/modules/modules-overview)

## Author Information

This repository is maintained by [Taylor Dolezal](https://github.com/onlydole) .

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
