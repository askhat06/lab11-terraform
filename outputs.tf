output "lb_url" {
  description = "Open this in a browser or curl it"
  value       = "http://localhost:${var.lb_port}"
}

output "web_names" {
  value = docker_container.web[*].name
}
