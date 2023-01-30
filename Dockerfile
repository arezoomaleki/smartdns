FROM ubuntu:latest


RUN apt update
RUN apt install sniproxy dnsmasq iptables -y
ADD dnsmasq.conf /etc/dnsmasq.tpl
ADD sniproxy.conf /etc/sniproxy.conf
RUN ln -sf /dev/stdout /var/log/sniproxy/sniproxy.log

EXPOSE 53/udp
EXPOSE 80
EXPOSE 443

# Replace your server's public IP instead of SERVER_IP below.
# You can also specify who has access to connect to this DNS server

ENV IP SERVER_IP
ENV ALLOWED_IP 0.0.0.0/0

CMD echo "Configure iptables..." && \
    iptables -A INPUT --source ${ALLOWED_IP} --jump ACCEPT && \
    iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED --jump ACCEPT && \
    iptables -P INPUT DROP && \
    iptables -S && \
    echo "Configure dnsmasq..." && \
    sed "s/{IP}/${IP}/" /etc/dnsmasq.tpl > /etc/dnsmasq.conf && \
    echo "Run sniproxy and dnsmasq..." && \
    dnsmasq -khR & sniproxy -c /etc/sniproxy.conf -f
