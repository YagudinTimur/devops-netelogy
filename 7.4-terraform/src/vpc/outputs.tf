output "vpc_id" {
    value = yandex_vpc_network.develop.id
}

output "subnet_id" {
    value = yandex_vpc_subnet.subnet.id
}