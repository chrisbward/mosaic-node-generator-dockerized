FROM node:16.17

WORKDIR /usr/src/app 

RUN mkdir source_images
RUN mkdir output

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

CMD [ "node", "dist/cli.js","-i","/usr/src/app/source_images/desired/photo.jpg","-d","/usr/src/app/source_images/collection","-W","/usr/src/app/output/thumbs"]