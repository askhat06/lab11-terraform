# The "VPC": a private Docker network only these containers share
resource "docker_network" "app" {
  name = "${var.prefix}-net"
}
