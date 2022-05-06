#!/usr/bin/env python3

import os
import json

for key in os.environ:
    print(key, os.environ[key])
