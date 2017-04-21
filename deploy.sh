#!/bin/bash

echo -e "\x1B[33mBuilding site. \x1B[0m"
bundle exec jekyll build
echo -e "\x1B[32mDone with building! \x1B[0m"
echo -e "\x1B[33mDeploying to glua.ua.pt\x1B[0m"
echo -e "\x1B[35mEnter your username and press [ENTER]:\x1B[0m "
read username
rsync -crvz --rsh='ssh' --delete-after --delete-excluded   ./_site/ "$username"@glua.ua.pt:/var/www/glua.ua.pt/
if [ $? -ne 0 ]; then
    echo -e "\x1B[31m \n\n Error trying to connect the server (rsync) \x1B[0m"
    sed -i -e 's/https:\/\/glua.ua.pt/http:\/\/localhost:4000/g' _config.yml
    exit 1
fi
echo -e "\x1B[32mDone with deploy!\x1B[0m"
