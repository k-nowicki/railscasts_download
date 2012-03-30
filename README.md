# Railscasts Download

Download all revised and pro railscasts with one-line command!

Downloader use Railscasts rss feed to get list of all videos. Automatic downloads for pro accounts working with V > 0.2.2.

## Example

All railscasts including revised and pro (pro account required):

    railscasts_download --pro -login my_login@railscasts.com
    > Enter your password:  *********

custom railscasts list:

    railscasts_download --rss_uri /home/yourname/custom_railscasts_list.rss


or simply put:

    railscasts_download

to get all free railscasts.
You can also download only latest railscasts providing option --after.
Put:

    railscasts_download --help

to get available options list.

## Installation

    gem install railscasts_download

## Requirements

 * Ruby >= 1.9.2
 * Bundler
 * GNU wget

## Running tests

    bundle exec rake

## License

Released under the MIT license. Copyright (C) 2012 Karol Nowicki