FROM alpine as base
WORKDIR /usr/src/app
RUN apk add --no-cache nodejs

FROM base as builder
RUN apk add --no-cache nodejs-npm
COPY package.json package-lock.json ./
RUN npm install --production
RUN mv node_modules prod_node_modules
RUN npm install
COPY . .
RUN npm run build --standalone

FROM base
COPY --from=builder /usr/src/app/.nuxt .nuxt
COPY --from=builder /usr/src/app/prod_node_modules node_modules
ENV HOST 0.0.0.0
EXPOSE 3000
CMD [ "node", "node_modules/nuxt-start/bin/nuxt-start.js" ]
