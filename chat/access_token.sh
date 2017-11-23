#/bin/bash
# Chat API
# Getting Client Credentials from Access Token
# ./exchange-token.sh <client-id> <client-secreet> <access-token>
# Access token can be acquired from running "pm2 log"
# BASE64 is encoded code from "oauthUsername:oauthPassword" that could be acquired from .env file
echo 'This will get the Clint Credentials from the Access Token\n'
echo 'Please enter Client ID\n'
read clientID
echo 'Please enter Client Secret\n'
read clientSecreet
combined=$clientID:$clientSecreet
baseEncoded64=`printf $combined | base64 | tr -d '[:space:]'`
echo $combined
echo 'below is your base64\n'
echo $baseEncoded64
echo 'Please enter path to your Private Key file (.key)\n'
echo 'Example /app/demo-server/nodejs/ssl/bbmmobilenews.com_thawte.key\n'
read key
echo 'Please enter path to your Cert file (.crt)\n'
echo 'Example /app/demo-server/nodejs/ssl/bbmmobilenews.com_thawte.crt\n'
read crt
curl -v --cert $crt --key $key -H "Content-Type:application/x-www-form-urlencoded" -H "Accept: application/json" -H "Authorization: Basic $baseEncoded64" -d "grant_type=client_credentials" "https://auth-beta.bbm.blackberry.com:8443/oauth/token"
