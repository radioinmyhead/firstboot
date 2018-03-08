#!/bin/bash
set -x 
set -e

cd $(dirname $0)

cp gpu.timer /etc/systemd/system/
cp gpu.service /etc/systemd/system/
cp gpu_fps_test.run /usr/local/sbin/
chmod +x /usr/local/sbin/*

systemctl enable gpu.timer
systemctl start  gpu.timer
