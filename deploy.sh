#!/bin/bash

echo -e "\x1B[32mDeploying to glua.ua.pt\x1B[0m"
rsync -crvz --rsh='ssh' --delete-after --delete-excluded   ./_site/ glua.ua.pt:public_html/
if [ $? -ne 0 ]; then
    exit 1
fi
echo -e "\x1B[32mDone!\x1B[0m"
