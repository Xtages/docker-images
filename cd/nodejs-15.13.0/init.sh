nohup /usr/bin/dockerd --host=unix:///var/run/docker.sock --host=tcp://127.0.0.1:2375 --storage-driver=overlay2 > /dev/null 2>&1 &
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 605769209612.dkr.ecr.us-east-1.amazonaws.com > /dev/null 2>&1
