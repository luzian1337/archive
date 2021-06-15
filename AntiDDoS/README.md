**A custom repo for Cloudflare firewall ruleset.**
```
1 => T1 "Country" (aka TOR) is always challenged to avoid TOR routed HTTP floods.
2 => Couple of "bad" countries are JS challenged in order to avoid RAW HTTP floods (mostly compromised IoT devices)
3 => A good set of known hosting/VPN ASN to be challenged in order to avoid proxy based HTTP floods.
```


**Additional mitigations can be applied as:**


```
1 => Nginx (or webserver/balancer) rate limit closing/resetting the connections (Nginx ex: error code 444) triggering the Cloudflare "Origin protection" and "HTTP DDoS attack protection".
2 => Monitoring of HTTP requests in order to detect spikes and forcing a captcha challenge for any ASN
3 => Block of unwanted HTTP methods via Cloudflare firewall rules
4 => Block of URI queries via Cloudflare firewall rules when sites does not require it in order to avoid cache bypass (ex. static site parts, pretty urls)
```

Stay safe :D

