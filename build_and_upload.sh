set -e
set -x
CURRENT_TIME=$(date +%Y%m%d_%H%M%S)
docker build . --tag=ubuntu_dev
docker tag ubuntu_dev laiyijie/ubuntu_dev:latest
docker tag ubuntu_dev laiyijie/ubuntu_dev:$CURRENT_TIME
docker push laiyijie/ubuntu_dev:latest
docker push laiyijie/ubuntu_dev:$CURRENT_TIME
