#!/bin/bash

set -e

python3 -m ensurepip --upgrade

# add pip to path and source it to make sure pip works
echo "export PATH=$PATH:${HOME}/.local/bin" >> .bashrc
source ~/.bashrc

python3 -m pip install ansible

ansible-playbook tasks.yaml
