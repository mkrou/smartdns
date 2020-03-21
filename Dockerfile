FROM alpine:latest
RUN apk --no-cache add dnsmasq sniproxy
ADD dnsmasq.conf /etc/dnsmasq.conf
ADD sniproxy.conf /etc/sniproxy.conf

EXPOSE 53 53/udp
EXPOSE 80
EXPOSE 443

ENV IP 127.0.0.1
CMD dnsmasq -khR \
    --address=/netflix.com/${IP} \
    --address=/netflix.net/${IP} \
    --address=/iplocation.net/${IP} \
    --address=/netflix.com/${IP} \
    --address=/netflix.net/${IP} \
    --address=/nflximg.net/${IP} \
    --address=/nflxvideo.net/${IP} \
    --address=/nflxso.net/${IP} \
    --address=/nflxext.com/${IP} \
    & sniproxy -c /etc/sniproxy.conf -f