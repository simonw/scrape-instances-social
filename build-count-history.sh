#!/bin/bash
git-history file counts.db instances.json \
  --convert "return [
    {
        'id': 'all',
        'users': sum(d['users'] or 0 for d in json.loads(content)),
        'statuses': sum(int(d['statuses'] or 0) for d in json.loads(content)),
    }
  ]" --id id
