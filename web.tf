resource "docker_image" "nginx" {
  name         = "nginx:1.27-alpine"
  keep_locally = true
}

# N identical web containers
resource "docker_container" "web" {
  count = var.web_count
  name  = "${var.prefix}-web-${count.index + 1}"
  image = docker_image.nginx.image_id

  networks_advanced {
    name = docker_network.app.id
  }

  upload {
    file    = "/etc/nginx/conf.d/default.conf"
    content = <<-CONF
      server {
        listen 80;
        default_type text/plain;
        location / { return 200 "Hello from ${var.prefix}-web-${count.index + 1} ($hostname)\n"; }
      }
    CONF
  }
}
