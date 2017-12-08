#!/bin/bash
# pre-commit git hook to check the validity of a puppet manifest
#
# Prerequisites:
#   gem install puppet-lint puppet rspec-puppet puppetlabs_spec_helper
#
# Install:
#  ln -s ~/.myterm/bash/scripts/git/hooks/pre-comit-puppet.sh /path/to/repo/.git/hooks/pre-comit
#

echo "### Checking puppet syntax, for science! ###"
for file in `git diff --name-only --cached | grep -E '\.(pp)'`
do
  # Only check new/modified files
  if [[ -f $file ]]
  then
    puppet-lint \
      --no-80chars-check \
      --no-autoloader_layout-check \
      --no-nested_classes_or_defines-check \
      --no-variable_scope-check \
      --no-2sp_soft_tabs-check \
      --with-filename $file

    # Set us up to bail if we receive any syntax errors
    if [[ $? -ne 0 ]]
    then
      syntax_is_bad=1
    else
      echo "$file looks good"
    fi
  fi
done
echo ""

echo "### Checking if puppet manifests are valid ###"
for file in `git diff --name-only --cached | grep -E '\.(pp)'`
do
  if [[ -f $file ]]
  then
    puppet parser validate $file
    if [[ $? -ne 0 ]]
    then
      echo "ERROR: puppet parser failed at: $file"
      syntax_is_bad=1
    else
      echo "OK: $file looks valid"
    fi
  fi
done
echo ""

echo "### Checking if ruby template syntax is valid ###"
for file in `git diff --name-only --cached | grep -E '\.(erb)'`
do
  if [[ -f $file ]]
  then
    erb -P -x -T '-' $file | ruby -c
    if [[ $? -ne 0 ]]
    then
      echo "ERROR: ruby template parser failed at: $file"
      syntax_is_bad=1
    else
      echo "OK: $file looks like a valid ruby template"
    fi
  fi
done
echo ""

if [[ $syntax_is_bad -eq 1 ]]
then
  echo "FATAL: Syntax is bad. See above errors"
  exit 1
else
  echo "Everything looks good."
fi
