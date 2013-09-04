# TITLE: Importing GeoJSON Example in Python
# AUTHOR: Tom Schenk Jr., City of Chicago
# CREATED: 2013-01-23
# UPDATED: 2013-09-04
# NOTES: Quick example to import GeoJSON data in Python.
# MODULES: json

import json
bikeroutes_json = open('PATH/TO/FILE/data/Bikeroutes.json', 'r')
bike_routes = json.load(bikeroutes_json)
json_data.close(bikeroutes_json)