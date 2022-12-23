#! /bin/bash

echo -e "\n\n*** installing pip ***\n\n"
python -m ensurepip

echo -e "\n\n*** Install ansible pip ***\n\n"
python -m pip install --user ansible

echo -e "\n\n*** Installing collections ***\n\n"
ansible-galaxy install -r requirements.yml
