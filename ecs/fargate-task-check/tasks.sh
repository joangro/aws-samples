#!/bin/bash -e
aws ecs list-clusters  --output text | cut -d ':' -f 6 | cut -d '/' -f 2 > clusters
echo "-----------------------------"
while read i
do
        aws ecs list-services --cluster $i --launch-type FARGATE --output text | cut -d ':' -f 6 | cut -d '/' -f 3 > services
        while read j
        do
                echo "Cluster: $i"
                echo "Service: $j"
                aws ecs list-tasks --cluster $i --service $j --output text | cut -d ':' -f 6 | cut -d '/' -f 3 > tasks
                while read k
                do
                        echo "Task: $k"
                        aws ecs describe-tasks --cluster $i --tasks $k --query 'tasks[*].createdAt' --output text
                done < tasks
                echo "-----------------------------"
        done < services
done < clusters
