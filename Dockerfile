FROM ghost:4.47.0-alpine

RUN apk update && apk add curl

COPY write_config.py write_config.py
RUN chmod +x write_config.py

CMD ["node", "current/index.js"]
