#!/bin/bash

[ "$architecture" == "amd64" ] && image=czen/docker-partkeepr:latest
[ "$architecture" == "i386" ]  && image=czen/docker-partkeepr:latest
#[ "$architecture" == "armhf" ] && image=czen/docker-partkeepr:latest
[ -z $image ] && ynh_die "Sorry, your $architecture architecture is not supported ..."

# options="-p $port:80 -v $data_path/data:/data -v /var/run/docker.sock:/var/run/docker.sock"
options="-v $data_path/data:/data -v /var/run/docker.sock:/var/run/docker.sock"
# containeroptions="--no-auth"

iptables -t filter -N DOCKER

# docker run -d --network="host" --name=$app --restart always $options -e PORT=$port $image $containeroptions 1>&2
docker run -d --network="host" --name=$app --restart always $options -e PORT=$port $image 1>&2
CR=$?

echo $CR
