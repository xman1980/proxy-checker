#!/bin/bash

# We are trying to reach this url via the given HTTP Proxy Server
url="https://ifconfig.co/json"

# Timeout time (in seconds)
timeout=1


    proxy_server=`shuf -n 1 $1`

    # We're fetching the return code and assigning it to the $result variable
    result=`curl -I -s -x $proxy_server --connect-timeout $timeout $url | head -n 1  | cut -d/ -f1`
    #echo $result

    # If the return code is 200, we've reached to $url successfully
    if [ "$result" = "HTTP" ]; then
        echo "$proxy_server :: OK (proxy works)"

    # Otherwise, we've got a problem (either the HTTP Proxy Server does not work
    # or the request timed out)

    else
        echo "$proxy_server :: ERR (proxy does not work or request timed out)"
    fi
