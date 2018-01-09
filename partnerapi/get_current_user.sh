#!/bin/bash

# Partner API
# Get Current User Profile

# Access token could be acquired from running pm2 log
echo 'This will return Current User Profile from Exchange oken.'
echo 'Please enter your Access Token (bearer abcdefghijklmnopqrstuvwxyz)'
read accessToken
echo 'Enter URL'
echo 'Example https://auth-str.eval.blackberry.com:8443'
read URL
# https://auth-beta.bbm.blackberry.com:8443
# https://auth-str.eval.blackberry.com:8443
# https://auth2.bbm.blackberry.com

curl -v -H "Authorization:$accessToken" "$URL/v2/user/profile"