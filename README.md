# Smart DNS

Stupidly simple Smart DNS proxy to watch Netflix.

## Example
```bash
docker run -it --cap-add=NET_ADMIN -p 53:53/udp -p 443:443 -p 80:80 -e IP=127.0.0.1 mkrou/smartdns
```

## Variables
| ENV  |  Default  |  Description  |
|---|---|---|
| IP  | 127.0.0.1  | Your public ip for server  |
| ALLOWED_IP | 0.0.0.0/0  | Your allowed ip for client |