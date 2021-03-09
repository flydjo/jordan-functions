#!/bin/sh
varFILENAME="send-alert-edi-slack";
varFUNCTIONAME="sendAlertEdiSlack";

mkdir tmp
mkdir tmp/modules

if [ -d "/tmp" ]; then
    cp -R modules/. tmp/modules
    cp package.json tmp/
    cp package-lock.json tmp/
fi

cd tmp

cat > index.js << EOF1
const { $varFUNCTIONAME } = require("./$varFILENAME");

module.exports = { $varFUNCTIONAME };
EOF1

cd ..
cd functions
cp $varFILENAME.js ../tmp
cd ..
cd tmp
pwd

gcloud functions deploy $varFUNCTIONAME --region europe-west1 --trigger-http --runtime nodejs10 --entry-point $varFUNCTIONAME

cd ..
rm -rf tmp/
