#!/bin/bash

printf 'Partner API\n'
printf 'Refresh token\n'
# ./exchange-token.sh <client-id> <client-secreet> <access-token>
printf 'Access token could be acquired from running pm2 log\n'
printf 'BASE64 is encoded code from "oauthUsername:oauthPassword" that could be acquired from .env file in the server\n'

printf 'This will exhchange short-lived token to long-lived token.\n'
printf 'Please enter clientId/oauthUsername\n'
read clientID
printf 'Please enter clientSecreet/oauthPassword\n'
read clientSecreet
# translate to base64
combined=$clientID:$clientSecreet
baseEncoded64=`printf $combined | base64 | tr -d '[:space:]'`
printf 'below is your base64\n'
printf $baseEncoded64

printf '\nPlease enter refresh_token that\n'
printf 'Acquired from exchange_token.sh\n'
read refreshToken
printf '\nPlease enter path to your Private Key file (.key)\n'
printf 'Example /app/demo-server/nodejs/ssl/bbmmobilenews.com_thawte.key\n'
read key
printf '\nPlease enter path to your Cert file (.crt)\n'
printf 'Example /app/demo-server/nodejs/ssl/bbmmobilenews.com_thawte.crt\n'
read crt

curl -v --cert $crt --key $key -H "Content-Type:application/x-www-form-urlencoded" -H "Accept: application/json" -H "Authorization: Basic $baseEncoded64" -d "grant_type=refresh_token&refresh_token=$refreshToken" "https://auth-beta.bbm.blackberry.com:8443/oauth/token"
