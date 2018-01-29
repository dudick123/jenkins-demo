#!/usr/bin/env bash

# stop on errors
set -e

# at this point, image should be built and start within 5 seconds
sleep 5

rc=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)
# let logging catch up
sleep 1

if [ $rc1 -eq 0 ]
then
    echo "Image test passed"
else
    >&2 echo "An HTTP Request in the image test failed"
fi

exit $rc
