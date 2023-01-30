# SmartDNS
Use for passing the Sanctions



Step 1:
prepare a linux server (ubuntu/debian) with a PUBLIC IP address available on it.
Install docker on it, you can use the following link if you use ubuntu 20.04:
https://support.netfoundry.io/hc/en-us/articles/360057865692-Installing-Docker-and-docker-compose-for-Ubuntu-20-04


Step 2:
Clone this repo onto your server using this command (you have to install git first using "sudo apt install git"):
sudo git clone https://github.com/arezoomaleki/smartdns.git


Step 3:
go to the smartdns directory and change SERVER_IP in Dockerfile.



Step 4:
cd smartdns
sudo docker build . -t smartdns:latest
docker run -d -it --cap-add=NET_ADMIN -p 53:53/udp -p 443:443 -p 80:80 -e IP=ServerPublicIP maj0rdns:latest

P.S:
Everytime you add a domain into dnsmasq.conf and domains.text you have to remove your container, build a new docker image and docker run again.
