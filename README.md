# scrape-instances-social

https://instances.social/instances.json is a list of Mastodon instances, including their number of statuses and users.

This repo scrapes that and records the history of the file, a form of [Git scraping](https://simonwillison.net/2020/Oct/9/git-scraping/).

## Building a database

You can use the [git-history](https://datasette.io/tools/git-history) tool to build a SQLite database of the history of the instances:

    pip install -r requirements.txt
    # (or just pip install git-history)
    ./build-instance-history.sh

You can run that script multiple times and it will only update the database with new commits that have not been seen before.

You can also build a much smaller SQLite database of just the counts of users and statuses over time:

    ./build-count-history.sh

## Accessing the database

A script in this repository builds and publishes the `counts.db` database to S3. You can download the latest copy here - it's pretty small as it only records the total sum of users and statuses over time across all tracked instances.

https://scrape-instances-social.s3.amazonaws.com/counts.db

You can open this in [Datasette Lite](https://lite.datasette.io/) like so:

https://lite.datasette.io/?url=https://scrape-instances-social.s3.amazonaws.com/counts.db

Or visit this Observable notebook to see those figures plotted on charts:

https://observablehq.com/@simonw/mastodon-users-and-statuses-over-time
