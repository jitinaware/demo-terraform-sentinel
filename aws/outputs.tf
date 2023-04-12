output "external_ip" {
    value = aws_instance.tfesen.*.public_ip
}