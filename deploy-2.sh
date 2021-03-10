#!/bin/sh
for function_name in `git diff-tree --name-only -r develop master | grep -E "^functions/([^/])*/[^/]+\.js$" | cut -d / -f 2 | sort -u`
do
    GCP_PROJECT=jordan-playground-306709
    gcloud functions deploy $function_name \
        --entry-point $function_name \
        --runtime nodejs10 \
        --trigger-http \
        --region europe-west1 \
        --allow-unauthenticated \
        --project $GCP_PROJECT
done