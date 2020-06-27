#!/usr/bin/env bash
set -euo pipefail
# create venv
python3 -m venv ./.venv
# run venv
source .venv/bin/activate
# install esphome
pip3 install esphome
# spawn shell in venv
exec "${SHELL}"