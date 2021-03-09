#!/bin/sh
DIR='./functions'
for FUNCTION in "$DIR"/*
do
    cd $FUNCTION
    
    function_name=$(echo $FUNCTION | rev | cut -d '/' -f 1 | rev)
    GCP_PROJECT=jordan-playground-306709
    
    gcloud functions deploy $function_name \
        --entry-point $function_name \
        --runtime nodejs10 \
        --trigger-http \
        --region europe-west1 \
        --allow-unauthenticated \
        --project $GCP_PROJECT

    cd ../..
done