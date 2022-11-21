#!/bin/bash
git-history file counts.db instances.json \
  --convert "
  bad_instances = [
    'angelfire.glitch.me',
    'angelfire-1.glitch.me',
    'angelfire-2.glitch.me',
    'angelfire-3.glitch.me',
    'you-think-your-fake-numbers-are-impressive.well-this-instance-contains-all-living-humans.lubar.me',
    'gab.ai',
    'gab.com',
    'kathrynmorton21@mastodon.social',
    'banco@mastodon.social',
    'zahra@mastodon.social',
    'junhong@mastodon.social',
  ]
  instances = [
      instance for instance in json.loads(content)
      if instance['name'] not in bad_instances
  ]
  return [
    {
        'id': 'all',
        'users': sum(d['users'] or 0 for d in instances),
        'statuses': sum(int(d['statuses'] or 0) for d in instances),
    }
  ]" --id id
