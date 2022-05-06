FROM ghost:4.47.0-alpine

RUN apk update && apk add curl

WORKDIR $GHOST_INSTALL

RUN ln -s $GHOST_INSTALL/current/content/themes $GHOST_CONTENT/themes
COPY create-config.js create-config.js

COPY run.sh run.sh
RUN chmod +x run.sh

CMD ./run.sh
