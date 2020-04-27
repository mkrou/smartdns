FROM alpine:latest
RUN apk --no-cache add dnsmasq sniproxy iptables
ADD dnsmasq.conf /etc/dnsmasq.tpl
ADD sniproxy.conf /etc/sniproxy.conf

EXPOSE 53 53/udp
EXPOSE 80
EXPOSE 443

ENV IP 127.0.0.1
ENV ALLOWED_IP 0.0.0.0/0

CMD echo "Configure iptables..." && \
    iptables -P INPUT DROP && \
    iptables -A INPUT --source ${ALLOWED_IP} -j ACCEPT && \
    echo "Configure dnsmasq..." && \
    sed "s/{IP}/${IP}/" /etc/dnsmasq.tpl > /etc/dnsmasq.conf && \
    echo "Run sniproxy and dnsmasq..." && \
    dnsmasq -khR & sniproxy -c /etc/sniproxy.conf -f