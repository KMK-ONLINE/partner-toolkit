#!/bin/bash

echo 'this script used to broadcast'
printf 'Please enter clientId/oauthUsername\n'
read clientID
printf 'Please enter clientSecreet/oauthPassword\n'
read clientSecreet
combined=$clientID:$clientSecreet
baseEncoded64=`printf $combined | base64 | tr -d '[:space:]'`
echo $combined
printf 'this is your base64\n'
echo $baseEncoded64

printf 'Please enter Request Body\n'
printf 'Example grant_type=client_credentials&scope=bot\n'
read requestBody
 
curl -v --cert $crt --key $key \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -H "Accept: application/json" \
    -H "Authorization: Basic $baseEncoded64" \
    -d "$requestBody" \
    "$url"
