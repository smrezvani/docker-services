# Running GitLab CE

Running the container
```bash
docker compose up -d
```
Set root password for gitlab administrator
```bash
docker exec -it gitlab-web-1 bash
gitlab-rake "gitlab:password:reset[root]"
```
