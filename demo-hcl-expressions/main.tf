variable "mixed_list" {
#   type = list(any)
  default = ["string", 123, "more", 456]
}

# a variable that has a complex object with string name, number age, boolean is_student
variable "complex_object" {
  type = object({
    name = string
    age = number
    is_student = bool
  })
  default = {
    name = "John Doe"
    age = 30
    is_student = false
  }
}

output "mixed_list" {
  value = var.mixed_list
}

output "complex_object" {
    value = var.complex_object
}

resource "local_file" "mixed_list_file" {
  filename = "mixed_list.txt"
  content = join("\n", var.mixed_list)
}

resource "local_file" "complex_object_file" {
  filename = "complex_object.txt"
#   content = jsonencode(var.complex_object)
  content = <<EOF
  Name: ${var.complex_object.name}
  Age: ${var.complex_object.age}
  Is Student: ${var.complex_object.is_student}
EOF
}