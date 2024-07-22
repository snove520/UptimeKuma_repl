latest_version=$(curl -s https://api.github.com/repos/louislam/uptime-kuma/releases/latest | grep '"tag_name":' | cut -d '"' -f 4)
wget -O kuma.zip https://github.com/louislam/uptime-kuma/archive/refs/tags/${latest_version}.zip && unzip kuma.zip
mv -b uptime-kuma-${latest_version}/* ./ && mv -b uptime-kuma-${latest_version}/.[^.]* ./ && rm -rf *~ && rm -rf uptime-kuma-${latest_version} && rm -rf README.md
npm ci --production && npm run download-dist
echo 'require("./server/server.js");' > index.js
