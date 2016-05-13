import urllib2
import json

# Get latest current Mario cart on eBay Australia
url = 'http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=JodieBur-MarioBro-PRD-538ccaf50-bb20cf56&GLOBAL-ID=EBAY-AU&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=super%20mario%20bros%20nes&paginationInput.entriesPerPage=1'
req = urllib2.Request(url)
text_data = urllib2.urlopen(req).read()
data = json.loads(text_data)

# Extract the current asking price of the cart
data.values()[0][0]['searchResult'][0]['item'][0]['sellingStatus'][0]['currentPrice'][0]['__value__']

# Get latest expired Mario cart on eBay
url = 'http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findCompletedItems&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=JodieBur-MarioBro-PRD-538ccaf50-bb20cf56&GLOBAL-ID=EBAY-AU&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=super%20mario%20bros%20nes&paginationInput.entriesPerPage=1'
req = urllib2.Request(url)
text_data = urllib2.urlopen(req).read()
data = json.loads(text_data)

# Get last 3 expired Mario carts on eBay
url = 'http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findCompletedItems&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=JodieBur-MarioBro-PRD-538ccaf50-bb20cf56&GLOBAL-ID=EBAY-AU&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=super%20mario%20bros%20nes&paginationInput.entriesPerPage=3'
req = urllib2.Request(url)
text_data = urllib2.urlopen(req).read()
data = json.loads(text_data)

data.values()[0][0]['searchResult'][0]['item'][1]

# Get last 100 expired Mario carts
url = 'http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findCompletedItems&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=JodieBur-MarioBro-PRD-538ccaf50-bb20cf56&GLOBAL-ID=EBAY-AU&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=super%20mario%20bros%20nes'
req = urllib2.Request(url)
text_data = urllib2.urlopen(req).read()
data = json.loads(text_data)

# Get last 100 expired Trolls in Crazyland carts
url = 'http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findCompletedItems&SERVICE-VERSION=1.12.0&SECURITY-APPNAME=JodieBur-MarioBro-PRD-538ccaf50-bb20cf56&GLOBAL-ID=EBAY-AU&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=trolls%20nes%20pal%20a'
req = urllib2.Request(url)
text_data = urllib2.urlopen(req).read()
data = json.loads(text_data)
data.values()[0][0]['searchResult'][0]['item'][1]['listingInfo'][0]['endTime']

# Get last 100 expired TMNT carts (eBay Australia)
url = 'http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findCompletedItems&SERVICE-VERSION=1.12.0&SECURITY-APPNAME=JodieBur-MarioBro-PRD-538ccaf50-bb20cf56&GLOBAL-ID=EBAY-AU&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=teenage%20mutant%20ninja%20turtles%20nes'
req = urllib2.Request(url)
text_data = urllib2.urlopen(req).read()
data = json.loads(text_data)
data.values()[0][0]['searchResult'][0]['item'][63]['listingInfo'][0]['endTime']

# Get last 100 expired TMNT carts (eBay UK)
url = 'http://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findCompletedItems&SERVICE-VERSION=1.12.0&SECURITY-APPNAME=JodieBur-MarioBro-PRD-538ccaf50-bb20cf56&GLOBAL-ID=EBAY-GB&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=teenage%20mutant%20hero%20turtles%20nes'
req = urllib2.Request(url)
text_data = urllib2.urlopen(req).read()
data = json.loads(text_data)
data.values()[0][0]['searchResult'][0]['item'][99]['listingInfo'][0]['endTime']

# Try appending only the post information from two postings together
## Relevant variables:
## Listing title
## Listing location
## Global ID (eBay site)
## Start time
## End time
## Category name
## ListingType
## SellingState
## ShippingInfo - shipToLocations
## ShippingInfo - shippingServiceCost
## CurrentPrice
## Condition

# Title
data.values()[0][0]['searchResult'][0]['item'][0]['title'][0]

# Listing location
data.values()[0][0]['searchResult'][0]['item'][0]['title'][0]



