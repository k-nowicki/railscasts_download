# Railscasts Download

Download all revised and pro railscasts with one-line command!

Downloader use Railscasts rss feed to get list of all videos. Automatic downloads for pro accounts added in V 0.2.0.

## Example

All railscasts including revised and pro (pro account required):

    railscasts_download --revised -l my_login@railscasts.com
    > Enter your password:  *********

custom railscasts list:

    railscasts_download --rss_uri /home/yourname/custom_railscasts_list.rss

or simply put:

    railscasts_download

to get only free railscasts.

## Installation

    gem install railscasts_download

## Requirements

 * Ruby >= 1.9.2
 * Bundler

## Running tests

    bundle exec rake

## License

Released under the MIT license. Copyright (C) 2012 Karol Nowicki