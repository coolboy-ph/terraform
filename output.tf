# 1. Output Name Servers
output "R3_Name_Servers" {
  value = aws_route53_zone.R3-zone.name_servers
}

# 2. Output Private IPs
output "server_private_ip" {
  value = {
    for index, ip in aws_instance.web-server-instance- :
        index => ({"Private_IP_Address" = ip.private_ip})
  }
}

# 3. Output Public IPs
output "server_public_ip" {
  value = {
    for index, ip in aws_instance.web-server-instance- :
        index => ({"Public_IP_Address" = ip.public_ip})
  }
}