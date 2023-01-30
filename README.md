# SmartDNS
Use for passing the Sanctions



<h2>Step 1:</h2>
prepare a linux server (ubuntu/debian) with a PUBLIC IP address available on it.<br/>
Install docker on it, you can use the following link if you use ubuntu 20.04:<br/>
https://support.netfoundry.io/hc/en-us/articles/360057865692-Installing-Docker-and-docker-compose-for-Ubuntu-20-04

<h2>Step 2:</h2>
Clone this repo onto your server using this command (you have to install git first using "sudo apt install git"):<br/>
<code>$sudo git clone https://github.com/arezoomaleki/smartdns.git</code>


<h2>Step 3:</h2>
go to the smartdns directory and change SERVER_IP in Dockerfile.



<h2>Step 4:</h2>
<code>$cd smartdns</code><br/>
<code>$sudo docker build . -t smartdns:latest</code><br/>
<code>$docker run -d -it --cap-add=NET_ADMIN -p 53:53/udp -p 443:443 -p 80:80 -e IP=ServerPublicIP smartdns:latest</code><br/>
<br/><br/>
<div style='color: red'>
  <b>P.S:</b><br/>
  <b>Everytime you add a domain into dnsmasq.conf and domains.txt you have to remove your container, build a new docker image and docker run again.</b>
<div>
