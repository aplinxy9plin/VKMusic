#!/bin/bash
echo "[*] Compiling IPA"
$(which xcodebuild) clean build CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY="" -sdk `xcrun --sdk iphoneos --show-sdk-path` -arch arm64
mv build/Release-iphoneos/YOURAPPNAMEHERE.app YOURAPPNAMEHERE.app
mkdir Payload
mv YOURAPPNAMEHERE.app Payload/C0F3.app
echo "[*] Making ZIP > IPA"
zip -r9 YOURAPPNAMEHERE.ipa Payload/YOURAPPNAMEHERE.app
rm -rf build Payload
echo "[*] DONE! Load with Cydia Impactor"