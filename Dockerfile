FROM ghost:4.47.0-alpine

RUN apk update && apk add curl

WORKDIR $GHOST_INSTALL

COPY create-config.js create-config.js
COPY run.sh run.sh

RUN cp -a content.orig/* content/

RUN chmod +x run.sh

CMD ./run.sh
