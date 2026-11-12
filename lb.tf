resource "docker_container" "lb" {
  name  = "${var.prefix}-lb"
  image = docker_image.nginx.image_id

  networks_advanced {
    name = docker_network.app.id
  }

  ports {
    internal = 80
    external = var.lb_port
  }

  upload {
    file = "/etc/nginx/conf.d/default.conf"
    content = templatefile("${path.module}/lb.conf.tftpl", {
      servers = docker_container.web[*].name
    })
  }
}
