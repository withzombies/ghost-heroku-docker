FROM ghost:4.47.0-alpine

RUN apk update && apk add curl

COPY create-config.js create-config.js

RUN gosu node ghost config --ip '0.0.0.0' --port $PORT --no-prompt --db mysql 

CMD ["node", "current/index.js"]
