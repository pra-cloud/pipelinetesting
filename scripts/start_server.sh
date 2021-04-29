#!/bin/bash

cd /var/www/html/
c=$(ls -p | grep / | wc -w)

arr1=(Node React)
arr2=(index.js 3001)

arr=(*/)
for (( i=0; i<$c; i++ ))
do
        cd ./${arr[i]}
        if [ "${arr1[i]}" = "Node" ]
        then
                npm i
                pm2 start ${arr2[i]}
                cd ..
        elif [ "${arr1[i]}" = "React" ]
        then
                npm i
                npm run-script build
                pm2 serve build ${arr2[i]} --spa
                cd ..
        fi
done
