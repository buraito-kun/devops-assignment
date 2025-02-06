FROM node:20 AS build

WORKDIR /usr/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# ------------------------------------------------

FROM node:20-slim

WORKDIR /usr/app

COPY package.json .

RUN npm install --omit=dev

COPY --from=build /usr/app/dist /usr/app/dist

CMD ["node", "dist/index.js"]
