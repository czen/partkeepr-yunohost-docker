#!/bin/bash

[ "$architecture" == "amd64" ] && image=mhubig/partkeepr:latest
[ "$architecture" == "i386" ]  && image=mhubig/partkeepr:latest
#[ "$architecture" == "armhf" ] && mhubig/partkeepr:latest
[ -z $image ] && ynh_die "Sorry, your $architecture architecture is not supported ..."

options="-p $port:8980 -v $data_path/data:/data -v /var/run/docker.sock:/var/run/docker.sock"
containeroptions="--no-auth"

iptables -t filter -N DOCKER

docker run -d --name=$app --restart always $options $image $containeroptions 1>&2
CR=$?

echo $CR
