#!/usr/bin/env bash
echo "Executing Images Test Initial"

# stop on errors
set -e

# at this point, image should be built and start within 5 seconds
sleep 5

rc1=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8181)
# let logging catch up
sleep 1

[ $rc1 == "200" ]
rc=$?

if [ $rc -eq 0 ]
then
    echo "Image test passed"
else
    >&2 echo "An HTTP Request in the image test failed"
fi

exit $rc
