#!/bin/bash

vagrant box list | grep wheezy64 &> /dev/null
if [ $? == 1 ] ; then
  vagrant box add wheezy64 ~/Dropbox/Downloads/vagrant-wheezy64-puppet.box
fi
