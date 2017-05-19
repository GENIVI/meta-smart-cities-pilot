#!/bin/bash

# Copyright (c) 2017, GENIVI Alliance
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, you can obtain one at http://mozilla.org/MPL/2.0.

cmd=$1

while read -e -t 1 ; do
    if [ "$REPLY" ]
    then                                                                                                             
         /usr/bin/logger [v2x-example] command echoed: "$REPLY"                                                   
    fi                                                                                                               
done  < /dev/ttyACM1

/usr/bin/logger "[v2x-example] 1st read from ACM1..."

/usr/bin/logger "[v2x-example] Sending AT to ACM1..."

/bin/echo -e -n "vxmxat\r" < /dev/ttyACM1

while read -e -t 1 ; do : ; done < /dev/ttyACM1

/usr/bin/logger "[v2x-example] 2nd read from ACM1, now ready for a command..."

/bin/echo -e -n $cmd"\r" > /dev/ttyACM1

/usr/bin/logger "Sent command" $cmd

while read -e -t 1 ; do
    if [ "$REPLY" ]                                                                                                  
    then                                                                                                             
        /usr/bin/logger [v2x-example] got reply: "$REPLY"
    fi                                                                                                               
done < /dev/ttyACM1

/usr/bin/logger "[v2x-example] Command read complete."
