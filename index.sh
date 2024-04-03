#!/bin/bash

#I want to assign a default value of profile which is personal
profile=${1:-company}

echo "Profile: $profile"

if [ -f ~/.ssh/config ]; then
  echo "Config file exists"
else
  echo "Config file does not exist"
  exit 1
fi

# Edit this command, switch case with variable to support differences commands
# I want to support more than 1 text
case $profile in
  new)
    echo "Personal profile"
    sed -i -e 's/IdentityFile .*/IdentityFile \~\/\.ssh\/${this is where you put the profile}/' ~/.ssh/config
    ;;
  test)
    echo "Bright profile"
    sed -i -e 's/IdentityFile .*/IdentityFile \~\/\.ssh\/test_rsa/' ~/.ssh/config
    ;;
  *)
    echo "Got default company profile"
    sed -i -e 's/IdentityFile .*/IdentityFile \~\/\.ssh\/default_rsa/' ~/.ssh/config
    exit 1
    ;;
esac
