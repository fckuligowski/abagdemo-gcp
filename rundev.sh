#!/bin/bash
# Use this script to run the app as a developer from the command line
export GOOGLE_APPLICATION_CREDENTIALS=/Users/fckuligowski/Documents/A/work/tmp/gcp-abagdemo-svc-acct.json
export FLASK_RUN_PORT=30080
export FLASK_APP=main.py
source venv/bin/activate
flask run --host=0.0.0.0