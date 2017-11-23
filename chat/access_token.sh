#/bin/bash

# Chat API
# Getting Client Credentials from Access Token
# ./exchange-token.sh <client-id> <client-secreet> <access-token>
# Access token can be acquired from running "pm2 log"
# BASE64 is encoded code from "oauthUsername:oauthPassword" that could be acquired from .env file

echo This will get the Clint Credentials from the Access Token

echo 'Please enter Client ID'
read clientID
echo 'Please enter Client Secreet'
read clientSecreet
combined=$clientID:$clientSecreet
baseEncoded64=`printf $combined | base64 | tr -d '[:space:]'`
echo $combined
echo 'below is your base64'
echo $baseEncoded64
echo 'Please enter path to your Private Key file (.key)'
echo 'Example /app/demo-server/nodejs/ssl/bbmmobilenews.com_thawte.key'
read key
echo 'Please enter path to your Cert file (.crt)'
echo 'Example /app/demo-server/nodejs/ssl/bbmmobilenews.com_thawte.crt'
read crt

curl -v --cert $crt --key $key -H "Content-Type:application/x-www-form-urlencoded" -H "Accept: application/json" -H "Authorization: Basic $baseEncoded64" -d "grant_type=client_credentials" "https://auth-beta.bbm.blackberry.com:8443/oauth/token"
