FROM alpine:latest
RUN apk --no-cache add dnsmasq sniproxy
ADD dnsmasq.conf /etc/dnsmasq.conf
ADD sniproxy.conf /etc/sniproxy.conf
EXPOSE 53 53/udp
EXPOSE 80
EXPOSE 443
CMD dnsmasq -k & sniproxy -c /etc/sniproxy.conf -f