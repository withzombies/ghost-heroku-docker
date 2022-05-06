FROM ghost:4.47.0-alpine

RUN apk update && apk add curl

COPY create-config.js create-config.js

CMD ["node", "current/index.js"]
