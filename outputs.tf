output "folder_id" {
  value = var.create_folder ? yandex_resourcemanager_folder.folder[0].id : var.yc_folder_id
}

output "network_id" {
  description = "The ID of the VPC"
  value       = yandex_vpc_network.this.id
}

output "subnet_ids" {
  value = [for subnet in yandex_vpc_subnet.this : subnet.id]
}

output "subnet_zones" {
  value = [for subnet in yandex_vpc_subnet.this : subnet.zone]
}

output "subnets" {
  value = { for v in yandex_vpc_subnet.this : v.zone => tomap({
    "id" = v.id,
    "name" = v.name,
    "zone" = v.zone
  }
  ) }
}