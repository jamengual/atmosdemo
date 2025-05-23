
resource "local_file" "name_file" {
  content = templatefile("${path.module}/name_file.tpl", {
    name   = var.name
  })
  filename = "${path.module}/name_file.txt"
}

resource "null_resource" "my_resource" {
    triggers = {
    file_changed = md5(local_file.name_file.content)
  }

}

variable "name" {
    type = string
    description = "THE NAME"
    default = ""
}
