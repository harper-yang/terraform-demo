variable "server_port" {
  description = "The port"
  type        = number
  default     = 8080
}

variable "cluster_name" {
  description = "The name of the cluster"
  type        = string
}

variable "remote_db_state_path" {
    description = "The path to the remote db state file"
    type        = string
}
