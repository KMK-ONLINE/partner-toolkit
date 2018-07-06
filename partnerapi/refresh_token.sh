#!/bin/bash

printf 'Partner API\n'
printf 'Refresh token\n'
# ./exchange-token.sh <client-id> <client-secreet> <access-token>

printf 'This will get new token.\n'
printf 'Please enter clientId\n'
read clientID
printf 'Please enter clientSecreet\n'
read clientSecreet
# translate to base64
combined=$clientID:$clientSecreet
baseEncoded64=`printf $combined | base64 | tr -d '[:space:]'`
printf 'below is your base64\n'
printf $baseEncoded64

printf '\nPlease enter refresh_token that\n'
read refreshToken

# https://auth-beta.bbm.blackberry.com:8443
# https://auth-str.eval.blackberry.com:8443
# https://auth2.bbm.blackberry.com
curl -v  -H "Content-Type:application/x-www-form-urlencoded" -H "Accept: application/json" -H "Authorization: Basic $baseEncoded64" -d "grant_type=refresh_token&refresh_token=$refreshToken" "https://token.bbmessaging.com/oauth/token"
