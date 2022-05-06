FROM ghost:4.47.0-alpine

RUN apk update && apk add curl

CMD ["node", "current/index.js"]
