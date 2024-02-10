# uptime-kuma-container
A container for uptime kuma

## Backup Script

```
sqlite3 kuma.db ".backup '/mnt/volumes/container/kuma.data'"
```

Dump
```
/usr/bin/sqlite3 kuma.db ".dump" | /bin/gzip -c > /mnt/volumes/container/kuma.gz
```


## Recover
```
/bin/zcat /mnt/volumes/container/kuma.gz | /usr/bin/sqlite3 kuma.db
```

https://github.com/louislam/uptime-kuma

https://github.com/louislam/uptime-kuma/issues/139


# uptime-kuma-container
A container for uptime kuma


	nginx.ingress.kubernetes.io/auth-tls-verify-client: "on"
	nginx.ingress.kubernetes.io/auth-tls-secret: "utils/ca-certs"
	nginx.ingress.kubernetes.io/auth-tls-verify-depth: "1"
	nginx.ingress.kubernetes.io/auth-tls-error-page: "https://youtu.be/t3otBjVZzT0"
	nginx.ingress.kubernetes.io/auth-tls-pass-certificate-to-upstream: "false"

 mTLS

https://mjpereira.medium.com/mutual-tls-with-ingress-nginx-controller-83b181f3bee0




# uptime-kuma-container
A container for uptime kuma


https://github.com/louislam/uptime-kuma

https://github.com/louislam/uptime-kuma/issues/139


# uptime-kuma-container
A container for uptime kuma


	nginx.ingress.kubernetes.io/auth-tls-verify-client: "on"
	nginx.ingress.kubernetes.io/auth-tls-secret: "utils/ca-certs"
	nginx.ingress.kubernetes.io/auth-tls-verify-depth: "1"
	nginx.ingress.kubernetes.io/auth-tls-error-page: "https://youtu.be/t3otBjVZzT0"
	nginx.ingress.kubernetes.io/auth-tls-pass-certificate-to-upstream: "false"

 mTLS

https://mjpereira.medium.com/mutual-tls-with-ingress-nginx-controller-83b181f3bee0


From man curl:

-x, --proxy <[protocol://][user:password@]proxyhost[:port]>

	 Use the specified HTTP proxy. 
	 If the port number is not specified, it is assumed at port 1080.
	 
	 


mTLS is not what I need

Maybe use SQUID proxy

https://dev.to/suntong/a-short-guide-on-squid-transparent-proxy-ssl-bumping-k5c

https://wiki.alpinelinux.org/wiki/Setting_up_Explicit_Squid_Proxy#Blocking_domains

curl -v --cert test_cert.pem --key test_key.pem https://git.gautier.org


openssl s_client -connect recipes.gautier.org:443 -key test_key.pem  -cert test_cert.pem -CAfile /ca_crt.pem -state


