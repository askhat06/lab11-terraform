variable "prefix" {
  description = "Name prefix for every resource (like the course resource prefix)"
  type        = string
  default     = "lab11"
}

variable "web_count" {
  description = "How many web containers (the 'desired capacity')"
  type        = number
  default     = 2

  validation {
    condition     = var.web_count >= 1 && var.web_count <= 5
    error_message = "web_count must be between 1 and 5."
  }
}

variable "lb_port" {
  description = "Port on your laptop where the load balancer listens"
  type        = number
  default     = 8080
}
