FROM ghost:4.47.0-alpine

RUN apk update && apk add curl

WORKDIR $GHOST_INSTALL

COPY create-config.js create-config.js
COPY run.sh run.sh
RUN chmod +x run.sh

RUN cp -r content.orig/* content/

CMD ./run.sh
