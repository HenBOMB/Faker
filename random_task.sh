#!/bin/bash

# random number between 00:00 and 17:00
RANDOM_MINUTES=$((RANDOM % (5 * 60)))

HOURS=$((RANDOM_MINUTES / 60))
MINUTES=$((RANDOM_MINUTES % 60))
RANDOM_TIME=$(date -d "12:00 today + $HOURS hours + $MINUTES minutes" +"%H:%M")

echo "Task scheduled at $RANDOM_TIME"

echo "auto_commit.sh" | at $RANDOM_TIME
