#!/usr/bin/env python3

import os
import json
from urllib.parse import urlparse

config = json.load(open("config.template.json"))

deploy_env = os.environ.get("NODE_ENV", "production")

config["server"]["port"] = int(os.environ["PORT"])

db = urlparse(os.environ["JAWSDB_URL"])

config["database"]["connection"] = {
    "host": db.hostname,
    "port": db.port,
    "user": db.username,
    "password": db.username,
    "database": db.path[1:]
}
config["paths"]["contentPath"] = os.environ["GHOST_CONTENT"]

print(config)

json.dump(config, open(f'config.{deploy_env}.json', 'w'))
