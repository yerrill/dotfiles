# Cloudflare DNS auto-update

## Python

Prerequisites.

`sudo apt install python3 python3-pip -y`

Creates virtual environment in home directory, install dependencies, and setup `.env` file.

```bash
cd /home/z && \
    mkdir cf && \
    cd cf && \
    python3 -m venv venv && \
    source venv/bin/activate && \
    pip install requests cloudflare && \
    echo "CF_API_TOKEN=" > .env && \
    echo "CF_ZONE=" >> .env && \
    echo "CF_RECORD=" >> .env
```

Then copy `cfdns.py` into `cf` directory. Fill values into `.env` file.

## CFDNS service

Copy systemd service: `/etc/systemd/system/cfdns.service`.

`sudo systemctl start cfdns && sudo systemctl enable cfdns`

## Other

`journalctl -u cfdns`, `journalctl -u cfdns --vacuum-time=Xd`
