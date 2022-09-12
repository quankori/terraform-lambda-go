resource "aws_ecr_repository" "repository" {
  for_each = toset(var.repository_list)
  name     = each.key
}

resource "docker_registry_image" "backend" {
  for_each = toset(var.repository_list)
  name     = "${aws_ecr_repository.repository[each.key].repository_url}:latest"

  build {
    context    = "../api"
    dockerfile = "${each.key}.Dockerfile"
  }
}
