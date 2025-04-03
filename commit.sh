#!/bin/sh

# Define an array of names (POSIX sh doesn't support arrays, so we use a space-separated string)
names="Dad Mom Grandma Cousin Brother Sister Uncle Aunt Friend Neighbor Teacher Coach"

# Generate a random number of commits between 1 and 3
commit_count=$(( $(od -An -N1 -i /dev/random) % 3 + 1 ))

echo "Executing $commit_count commit(s)..."

i=1
for name in $names; do
  if [ $i -gt $commit_count ]; then
    break
  fi

  # Select a random name from the list
  set -- $names
  random_index=$(( $(od -An -N1 -i /dev/random) % $# + 1 ))
  random_name=$(eval echo \$$random_index)

  # Append the greeting to streak.txt
  echo "Hello $random_name!" >> streak.txt

  # Stage changes and commit with a commit message indicating the commit number
  git add .
  git commit -m "Commit #$i: Hello $random_name!"

  # Push the commit
  git push

  # Sleep for a random duration between 1 and 3 seconds before the next commit
  if [ $i -lt $commit_count ]; then
    sleep_time=$(( $(od -An -N1 -i /dev/random) % 3 + 1 ))
    echo "Waiting $sleep_time second(s) before next commit..."
    sleep $sleep_time
  fi

  i=$((i + 1))

done
