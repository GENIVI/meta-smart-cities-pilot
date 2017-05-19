#!/bin/sh

# Copyright (c) 2017, GENIVI Alliance
# 
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, you can obtain one at http://mozilla.org/MPL/2.0.

/bin/echo "USB Reattach..."

/bin/echo -n "u" > /dev/ttyACM2

/bin/echo "Sleep..."

/bin/sleep 2

/bin/echo "Setting new stty for ACM1..."

/bin/stty -F /dev/ttyACM1 min 100 time 2 -hupcl brkint ignpar -opost -isig -icanon -echo

/bin/echo "Complete."
