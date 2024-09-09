
data "local_file" "input" {
  filename = "${path.module}/input.txt"
}

resource "local_file" "output" {
  content  = data.local_file.input.content
  filename = "${path.module}/output.txt"
}

resource "random_pet" "name" {

}

output "random_pet_name" {
  value = random_pet.name.id
}

resource "local_file" "pet_name" {
  content  = random_pet.name.id
  filename = "${path.module}/pet_name.txt"
}
