#!/bin/bash

# Generate a random time between 12:00 and 17:00
RANDOM_MINUTES=$((RANDOM % (5 * 60)))
HOURS=$((RANDOM_MINUTES / 60))
MINUTES=$((RANDOM_MINUTES % 60))
SCHEDULED_TIME=$(date -d "12:00 today + $HOURS hours + $MINUTES minutes" +"%H:%M")

# Convert times to epoch for comparison
CURRENT_TIME=$(date +%s)
SCHEDULED_EPOCH=$(date -d "$SCHEDULED_TIME" +%s)

TASK_SCRIPT="/home/henry/Desktop/Shells/Faker/commit.sh"

if [[ $SCHEDULED_EPOCH -lt $CURRENT_TIME ]]; then
    echo "Scheduled time $SCHEDULED_TIME is in the past. Running task now..."
    bash "$TASK_SCRIPT"
else
    echo "Task scheduled at $SCHEDULED_TIME"
    echo "$TASK_SCRIPT" | at $SCHEDULED_TIME
fi
