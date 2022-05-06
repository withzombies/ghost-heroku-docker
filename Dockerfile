FROM ghost:4.47.0-alpine

RUN apk update && apk add curl python3

COPY write-config.py write-config.py
RUN chmod +x write_config.py

CMD ["node", "current/index.js"]
