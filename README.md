# Docker-Perforce
Docker image for a p4d server
## Build
docker build -t perforce .
## Configure
- Copy docker-compose.yml.sample to docker-compose.yml and edit this file to match your configuration.
- If you have not ssl implemented, remove `-p ssl::1666` from the command `p4d -p ssl::1666 -r /Perforce`
### SSL
- To implement ssl remove `-p ssl::1666`
- run the container with `docker-compose up -d`
- run a terminal into the container `docker exec -ti perforce /bin/bash`
- then run:
```
cd /Perforce
mkdir {P4ROOT}/sslkeys
chmod 700 {P4ROOT}/sslkeys
export P4SSLDIR={P4ROOT}/sslkeys
p4d -Gc
p4d -Gf
```
-  Perforce data is stored in a separate Docker Volume so you can easily adapt it to your configuration. In the current configuration, the Volume is a shared network drive NFS.
### NFS
If you are using a NFS drive, you have just to change `<NETWORK_SHARED_DRIVE_IP>` and `<NETWORK_SHARED_DRIVE_FOLDER>`.
## Run
Now you can start the container with `docker-compose up -d`
