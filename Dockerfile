FROM ghost:4.47.0-alpine

RUN apk update && apk add curl

WORKDIR $GHOST_INSTALL
COPY create-config.js create-config.js

RUN su-exec node ghost config --ip '0.0.0.0' --port $PORT --no-prompt --db mysql 
RUN ls -l

CMD ["node", "current/index.js"]
