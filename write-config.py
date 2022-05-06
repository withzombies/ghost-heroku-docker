#!/usr/bin/env python3

import os
import json

config = json.load(open("config.template.json"))

deploy_env = os.environ.get("NODE_ENV", "production")

config["server"]["port"] = int(os.environ["PORT"])
config["database"]["connection"] = os.environ["JAWSDB_URL"]
config["paths"]["contentPath"] = os.environ["GHOST_CONTENT"]

print(config)

json.dump(config, open(f'config.{deploy_env}.json', 'w'))
