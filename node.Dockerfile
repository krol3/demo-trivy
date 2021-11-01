FROM node:9
WORKDIR /app

COPY package.json ./package.json
COPY package-lock.json ./package-lock.json
RUN npm install
COPY . .

RUN npm test

ARG npm_token

RUN echo "//registry.npmjs.org/:_authToken=${npm_token}" > .npmrc
RUN npm publish --access public

EXPOSE 8080
CMD [ "npm", "start" ]