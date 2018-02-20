#! /bin/bash

curl https://bootstrap.pypa.io/get-pip.py | python -
pip install git+https://github.com/gnuradio/pybombs.git
pybombs auto-config
pybombs recipes add-defaults
pybombs prefix init ~/prefix -a myprefix -R gnuradio-default
