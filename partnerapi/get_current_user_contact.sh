#!/bin/bash

# Partner API
# Get Current User Profile

# Access token could be acquired from running pm2 log
echo 'This will return BBID of current user contact.'
echo 'Please enter your Access Token (eg. bearer abcdefghijklmnopqrstuvwxyz)'
read accessToken

# https://auth-beta.bbm.blackberry.com:8443
# https://auth-str.eval.blackberry.com:8443
# https://auth2.bbm.blackberry.com

curl -v -H "Authorization:$accessToken" "https://token.bbmessaging.com/v2/user/contacts"
