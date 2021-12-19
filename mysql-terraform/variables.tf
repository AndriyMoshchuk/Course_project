variable "client_id" {}
variable "client_secret" {}

variable "agent_count" {
    default = 2
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "MySql"
}

variable cluster_name {
    default = "MySql_claster"
}

variable resource_group_name {
    default = "MySql_Group"
}

variable location {
    default = "westeurope"
}