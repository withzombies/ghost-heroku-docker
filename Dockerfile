FROM ghost:4.47.0-alpine

RUN apk update && apk add curl python3

COPY create-config.js create-config.js
CMD ["node", "create-config.js"]
