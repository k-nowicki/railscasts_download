# Railscasts Downloader

Download all revised and pro railscasts with one-line command!

Downloader use Railscasts rss feed to get list of all videos. At the time for downloading pro videos, rss content must be provide
explicitly by user (see examples).

## Example

login first to get access to railscasts pro rss feed, copy and save it as file named pro_railscasts.rss
(automatically download pro rss coming soon)

    railscasts_download --rss_uri /home/yourname/pro_railscasts.rss   #create rss file first!

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
