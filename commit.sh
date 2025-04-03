#!/bin/sh

# List of names as a space-separated string
names="Mom Grandma Cousin Uncle Aunt Brother Sister Friend"

# Randomly decide the number of commits (between 1 and 5)
num_commits=$(shuf -i 1-5 -n1)

# Loop through the number of commits
for i in $(seq 1 $num_commits); do
    # Select a random name from the list
    random_name=$(echo $names | tr ' ' '\n' | shuf -n1)
    # Append the greeting to streak.txt
    echo "Hello $random_name!" >> streak.txt
    # Stage the changes
    git add .
    # Commit with the greeting as the message
    git commit -m "Hello $random_name!"
    # Add a random delay (1 or 3 seconds) if not the last commit
    if [ $i -lt $num_commits ]; then
        delay=$(shuf -e 1 3 -n1)
        sleep $delay
    fi
done

# Push all commits to the remote repository
git push
