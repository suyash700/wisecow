#!/bin/bash

URL="https://www.google.com"   # checking Google

STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)

if [ "$STATUS" -eq 200 ]; then
    echo "Application is running fine ✅ (Status: $STATUS)"
else
    echo "Application is not responding ❌ (Status: $STATUS)"
fi
