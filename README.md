3x Nginx Server = ["nginx-server", "nginx-web-server-1", "nginx-web-server-2"]
   Private IPs  = ["10.0.1.50"   , "10.0.1.51"         , "10.0.1.52"         ]
   
Route53         = Create zone using with "nginx-server" public ip   

vpc.tf
1. Create vpc 
2. Create a Subnet 
3. Create Custom Route Table
4. Associate subnet with Route Table
5. Create Internet Gateway
6. Create Security Group to allow port 22,80,443

instance.tf
1. Create Provider
2. Create Credentials/Profile
3. Create Ubuntu server and install/enable three servers ["nginx-server", "nginx-web-server-1", "nginx-web-server-2"]

route53.tf
1. Create Hosted Zone
2. Create "A" record

output.tf
1. Output Name Servers
2. Output Private IPs
3. Output Public IPs
