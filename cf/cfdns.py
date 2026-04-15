import os
import json
from cloudflare import Cloudflare
import requests

token = os.environ.get("CF_API_TOKEN")
zone = os.environ.get("CF_ZONE")
record = os.environ.get("CF_RECORD")

if not token:
    raise ValueError("No Cloudflare API Token")


if not zone:
    raise ValueError("No Cloudflare zone")


if not record:
    raise ValueError("No Cloudflare Record")

ip_info = json.loads(
    requests.get("https://ifconfig.co", headers={"Accept": "application/json"}).content
)

client = Cloudflare(api_token=token)

record_response = client.dns.records.edit(
    dns_record_id=record,
    zone_id=zone,
    name="vpn.zylocal.com",
    content=ip_info["ip"],
    ttl=1,
    type="A",
)

print(record_response)
