#!/bin/bash

export NVM_DIR="$HOME/.nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install --lts
nvm use --lts

#Extensions Globais
#======================
npm install -g yarn
npm install -g npx
npm install -g tldr
npm install -g typescript
npm install -g @vue/cli
npm install -g vuepress
npm install -g @angular/cli
npm install -g eslint
npm install -g gitbook-cli
npm install -g lodash
npm install -g babel-cli
npm install -g expo-cli
npm install -g firebase-tools
npm install -g gatsby-cli
npm install -g jest
npm install -g lighthouse
npm install -g netlify-cli
npm install -g newman
npm install -g node-sass
npm install -g parcel-bundler
npm install -g pm2
npm install -g prettier
npm install -g serve
npm install -g surge
npm install -g update
npm install -g vercel
npm install -g @mockoon/cli