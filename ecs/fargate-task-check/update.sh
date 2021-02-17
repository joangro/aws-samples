#!/bin/bash
echo "-----------------------------"
aws ecs list-clusters  --output text | cut -d ':' -f 6 | cut -d '/' -f 2 | while read cluster;
do
        aws ecs list-services --cluster $cluster --launch-type FARGATE --output text | cut -d ':' -f 6 | cut -d '/' -f 3 | while read service;
        do
                echo "Cluster: $cluster"
                echo "Service: $service"
                aws ecs list-tasks --cluster $cluster --service $service --output text | cut -d ':' -f 6 | cut -d '/' -f 3 |  while read task;
                do
                        echo "Task: $task"
                        aws ecs describe-tasks --cluster $cluster --tasks $task --query 'tasks[*].createdAt' --output text
                done
                echo "-----------------------------"
        done
done
