#!/bin/bash

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80
LOG_FILE="system_health.log"

# Get CPU, Memory and Disk usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISK=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "CPU: $CPU% | Memory: $MEM% | Disk: $DISK%"

# Check thresholds
if (( ${CPU%.*} > CPU_THRESHOLD )); then
    echo "$(date): CPU usage high: $CPU%" >> $LOG_FILE
fi

if (( ${MEM%.*} > MEM_THRESHOLD )); then
    echo "$(date): Memory usage high: $MEM%" >> $LOG_FILE
fi

if (( DISK > DISK_THRESHOLD )); then
    echo "$(date): Disk almost full: $DISK%" >> $LOG_FILE
fi
