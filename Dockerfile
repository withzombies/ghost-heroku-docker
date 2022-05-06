FROM ghost:4.47.0-alpine

COPY create-config.js create-config.js

COPY run.sh run.sh
RUN chmod +x run.sh

CMD ./run.sh
