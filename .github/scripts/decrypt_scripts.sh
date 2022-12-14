#!/bin/sh
# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --pinentry loopback --passphrase=$ANDROID_KEYS_SECRET_PASSPHRASE --output android/key_files.zip --decrypt android/key_files.zip.gpg  
echo 
cd android && jar xvf key_files.zip && cd -
echo
mv ./android/upload-keystore.jks ./android/app
# move your file according to path in key.properties