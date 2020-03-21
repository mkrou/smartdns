FROM alpine:latest
RUN apk --no-cache add dnsmasq sniproxy
ADD dnsmasq.conf /etc/dnsmasq.tpl
ADD sniproxy.conf /etc/sniproxy.conf

EXPOSE 53 53/udp
EXPOSE 80
EXPOSE 443

ENV IP 127.0.0.1
CMD sed "s/{IP}/${IP}/" /etc/dnsmasq.tpl > /etc/dnsmasq.conf && dnsmasq -khR & sniproxy -c /etc/sniproxy.conf -f