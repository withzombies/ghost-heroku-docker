FROM ghost:4.47.0-alpine

RUN apk update && apk add curl python3

COPY config.template.json config.template.json
COPY write-config.py write-config.py
RUN chmod +x write-config.py

CMD ["node", "current/index.js"]
