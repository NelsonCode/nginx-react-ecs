FROM node:18-alpine3.15

WORKDIR /app

COPY . /app

ENV NODE_ENV=production

RUN npm i serve -g

RUN npm i --production

EXPOSE 3000

CMD ["npm", "run", "serve"]
