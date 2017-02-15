# Dokku Private Registry

Private registry server deployed as a dokku app with HTTP Basic auth using
`AUTH_USER` and `AUTH_PASSWORD` env variables.

## Setup

```bash
dokku apps:create my-registry
dokku config:set my-registry REGISTRY_HTTP_SECRET=$(openssl rand -hex 64)
dokku config:set my-registry AUTH_USER=user AUTH_PASSWORD=$(openssl rand -hex 16)
dokku storage:mount my-registry /var/lib/dokku/data/storage/my-registry:/var/lib/registry
dokku ps:set-restart-policy my-registry always
dokku domains:add my-registry my-registry.example.com
dokku letsencrypt my-registry
```

## Deploy

```bash
git remote add dokku dokku@dokku.example.com:my-registry
git push dokku master
```

## Test

```bash
docker login -u user -p password my-registry.example.com

docker pull busybox:latest
docker tag busybox:latest my-registry.example.com/user/busybox:latest
docker push my-registry.example.com/user/busybox:latest
docker rmi busybox:latest my-registry.example.com/user/busybox:latest
docker pull my-registry.example.com/user/busybox:latest
```
