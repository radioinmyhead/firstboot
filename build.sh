#!/bin/bash
set -x
set -e
cd $(dirname $0)
makeself test gpu_fps_test.run 'gpu fps test' ./post.sh
mv gpu_fps_test.run boot/
makeself boot firstboot.run 'first boot' ./installer.sh
