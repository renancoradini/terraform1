#!/bin/bash

sudo systemctl enable --now --no-block ecs.service

sudo yum update -y

sudo yum install -y ecs-init

sudo service docker start

sudo service ecs start

sudo service start ecs

sudo su
echo ECS_CLUSTER=ecs-denzelrr-cluster >> /etc/ecs/ecs.config

cat /etc/ecs/ecs.config | grep "ECS_CLUSTER"