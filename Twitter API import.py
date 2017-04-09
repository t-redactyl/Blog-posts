import tweepy
import json

consumer_key = "XXX"
consumer_secret = "XXX"
access_key = "XXX"
access_secret = "XXX"

auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_key, access_secret)
api = tweepy.API(auth, parser = tweepy.parsers.JSONParser())

searchquery = '"new years resolution" -filter:retweets'

data = api.search(q = searchquery, count = 100, lang = 'en',\
                  result_type = 'mixed')

data.values()[1][11]['text']
"My New Years resolution was to try and start taking cute pics and as you can \
    tell from my avi it's going gr88:)"
