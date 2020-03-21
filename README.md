Smart DNS

```bash
docker run -it --cap-add=NET_ADMIN -p 53:53/tcp -p 53:53/udp -p 443:443 -p 80:80 smartdns
```