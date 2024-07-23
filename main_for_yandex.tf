terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.16.0" # или другая актуальная версия
    }
  }
}

provider "docker" {
  host = "ssh://ubuntu@89.169.140.137"
}

resource "random_password" "mysql_root_password" {
  length  = 16
  special = true
}

resource "random_password" "mysql_user_password" {
  length  = 16
  special = true
}

resource "docker_container" "mysql" {
  image = "mysql:8"
  name  = "mysql_${random_password.mysql_root_password.result}"

  ports {
    internal = 3306
    external = 3306
    ip       = "127.0.0.1"
  }

  env = [
      "MYSQL_ROOT_PASSWORD=${random_password.mysql_root_password.result}",
      "MYSQL_DATABASE=wordpress",
      "MYSQL_USER=wordpress",
      "MYSQL_PASSWORD=${random_password.mysql_user_password.result}",
      "MYSQL_ROOT_HOST=%"
  ]

}
