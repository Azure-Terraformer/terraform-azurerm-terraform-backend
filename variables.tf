variable "location" {
  type        = string
  description = <<DESCRIPTION
  The Azure region where all resources for the Terraform State backend will be created.

  **Example:** `eastus`, `westeurope`, `centralus`
  
  This variable determines the geographical location of the Resource Group, Storage Account, and Storage Containers, ensuring that resources are provisioned in the desired Azure region.
  DESCRIPTION
}
variable "name" {
  type        = string
  description = <<DESCRIPTION
  The base name used for naming Azure resources associated with the Terraform State backend.

  This name is prefixed to the Azure Resource Group to ensure uniqueness and easy identification of resources.
  
  **Example:** If `name` is set to `terraform-state`, the Resource Group will be named `rg-terraform-state`.
  DESCRIPTION
}
variable "storage_prefix" {
  type        = string
  default     = "tf"
  description = <<DESCRIPTION
  A prefix added to the Storage Account names to ensure uniqueness and to follow naming conventions. The prefix is followed by a random string.

  This prefix helps in distinguishing Azure Storage Accounts intended to be used for Terraform State from other Storage Accounts within the same Azure environment.
  
  **Example:** With a `storage_prefix` of `"tf"`, the Storage Account might be named `"tfstorage"`.
  DESCRIPTION
}
variable "random_length" {
  type        = number
  default     = 8
  description = <<DESCRIPTION
  The length of the random string appended to the Storage Account name to ensure global uniqueness.

  **Default:** `8`
  
  Azure Storage Account names must be globally unique. This variable controls the length of the random suffix added to the `storage_prefix` and `name` to achieve this uniqueness.
  
  **Example:** A `random_length` of `8` might result in a Storage Account name like `sttfa1b2c3d4`.
  DESCRIPTION
}
variable "storage_replication_type" {
  type        = string
  default     = "LRS"
  description = <<DESCRIPTION
  The replication strategy for the Azure Storage Account used by Terraform.

  **Default:** `"LRS"`
  
  This setting determines how data is replicated to ensure durability and availability. Available options include:
  
    - **LRS (Locally-Redundant Storage):** Replicates data three times within a single data center.
    - **GRS (Geo-Redundant Storage):** Replicates data to a secondary region for disaster recovery.
    - **ZRS (Zone-Redundant Storage):** Replicates data across multiple availability zones within the primary region.
  
  Choose the replication type based on your redundancy and availability requirements.
  DESCRIPTION
}
variable "state_container_name" {
  type        = string
  default     = "tfstate"
  description = <<DESCRIPTION
  The name of the Azure Storage Container designated for storing Terraform state files (`tfstate`).

  **Default:** `"tfstate"`
  
  This container holds the state files that track the current state of your Terraform-managed infrastructure, enabling Terraform to manage resources effectively and maintain consistency across deployments.
  
  **Naming Considerations:** Ensure that the container name adheres to Azure naming conventions and does not conflict with existing containers.
  DESCRIPTION
}
variable "plan_container_name" {
  type        = string
  default     = "tfplan"
  description = <<DESCRIPTION
  The name of the Azure Storage Container designated for storing Terraform plan files (`tfplan`).

  **Default:** `"tfplan"`
  
  This container is used to store Terraform plan files, which outline the changes Terraform will apply to your infrastructure. Storing plan files separately can help in auditing and reviewing proposed changes before application.
  
  **Naming Considerations:** Ensure that the container name adheres to Azure naming conventions and does not conflict with existing containers.
  DESCRIPTION
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = <<DESCRIPTION
  A map of tags to assign to all resources created by this module.

  **Default:** `{}` (no tags)
  
  Tags are key-value pairs that help organize and categorize Azure resources. They can be used for various purposes such as cost management, automation, and access control.
  
  **Example:**
  
    ```hcl
    tags = {
      Environment = "Production"
      Project     = "Infrastructure"
    }
    ```
  
  **Best Practices:**
  
    - Use consistent naming conventions for tag keys and values.
    - Apply tags uniformly across all resources for easier management.
  DESCRIPTION
}
