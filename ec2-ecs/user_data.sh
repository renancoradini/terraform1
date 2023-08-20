#!/bin/bash

sudo yum update -y

sudo yum install -y ecs-init

sudo service docker start

sudo service ecs start

sudo service start ecs

echo ECS_CLUSTER=ecs-denzelrr-cluster >> /etc/ecs/ecs.config

cat /etc/ecs/ecs.config | grep "ECS_CLUSTER"