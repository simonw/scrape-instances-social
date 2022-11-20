# scrape-instances-social

https://instances.social/instances.json is a list of Mastodon instances, including their number of statuses and users.

This repo scrapes that and records the history of the file, a form of [Git scraping](https://simonwillison.net/2020/Oct/9/git-scraping/).

## Building a database

You can use the [git-history](https://datasette.io/tools/git-history) tool to build a SQLite database of the history of this file:

    pip install -r requirements.txt
    # (or just pip install git-history)
    ./build-history.sh

You can run that script multiple times and it will only update the database with new commits that have not been seen before.
