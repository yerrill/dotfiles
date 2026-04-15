pushd /etc/systemd/system/
sudo podman pod stop piholepod
sudo podman pod rm piholepod
sudo podman pull docker.io/pihole/pihole
sudo podman pod create -p 53:53/tcp -p 53:53/udp -p 80:80/tcp -p 443:443/tcp --name=piholepod
sudo podman create --pod=piholepod --name=pihole -t --env 'TZ=America/New_York' --env 'FTLCONF_webserver_api_password=PASSWORD' --env 'FTLCONF_dns_listeningMode=all' -v '/usr/share/etc-pihole:/etc/pihole' --cap-add=NET_ADMIN --cap-add=SYS_TIME --cap-add=SYS_NICE --restart=unless-stopped docker.io/pihole/pihole
sudo podman generate systemd --new --files --name piholepod
sudo podman image prune -af
sudo podman pod start piholepod
popd
