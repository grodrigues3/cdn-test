#!/bin/bash

# Install Stackdriver logging agent
# curl -sSO https://dl.google.com/cloudagents/install-logging-agent.sh
# sudo bash install-logging-agent.sh

# Install or update needed software
apt-get update
apt-get install -yq git supervisor python python-pip
sudo apt-get -qq install python-flask -y
pip install --upgrade pip virtualenv

# Account to own server process
useradd -m -d /home/pythonapp pythonapp

# Fetch source code
export HOME=/root
rm -r /opt/app
git clone https://github.com/grodrigues3/cdn-test/ /opt/app/

# Python environment setup
virtualenv -p python3 /opt/app/cdn/env
source /opt/app/cdn/env/bin/activate
/opt/app/gce/env/bin/pip install -r /opt/app/requirements.txt

# Set ownership to newly created account
chown -R pythonapp:pythonapp /opt/app

# Put supervisor configuration in proper place
cp /opt/app/python-app.conf /etc/supervisor/conf.d/python-app.conf

# Start service via supervisorctl
supervisorctl reread
supervisorctl update
