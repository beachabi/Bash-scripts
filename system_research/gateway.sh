# !/bin/bash

gateway=$(netstat -rn | grep 0.0.0.0 | awk '{print $2}' | sed s/0.0.0.0/""/g | sed s/' '/""/g)
echo $gateway
