#!/bin/sh
set -o xtrace
set -e
curl https://dl.feenk.com/tentative/GlamorousToolkitLinux64.zip -o GlamorousToolkitLinux64.zip
rm -rf GlamorousToolkitLinux64-v0.*
unzip GlamorousToolkitLinux64.zip