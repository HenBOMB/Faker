#!/bin/sh

names="Mom Grandma Cousin Uncle Aunt Brother Sister Friend"
num_commits=$(shuf -i 1-5 -n1)

for i in $(seq 1 $num_commits); do
    random_name=$(echo $names | tr ' ' '\n' | shuf -n1)

    echo "Hello $random_name!" >> streak.txt

    git add .

    git commit -m "Hello $random_name!"

    if [ $i -lt $num_commits ]; then
        delay=$(shuf -e 1 3 -n1)
        sleep $delay
    fi
done

git push
