require "rubygems"
require "bundler/setup"

# load gems from the Gemfile
Bundler.require(:default)

IL_SP_FACTORY = RGeo::Cartesian.simple_factory(:srid => 3435)
FIFTY_W_WASHINGTON = IL_SP_FACTORY.point(1175710.4337080137, 1900971.9210244615)
# Polygon buffered 500ft from 50 W Washington
FIFTY_W_BUFFERED = FIFTY_W_WASHINGTON.buffer(500)

# Load GeoJSON
geojson = File.read(File.expand_path(
  File.dirname(__FILE__) + "/../../data/Bikeroutes.json"))
features = RGeo::GeoJSON.decode(geojson, :json_parser => :json)

# Filter Streets near 50 W Washington
nearby_streets = features.select { |street| street.geometry.intersects?(FIFTY_W_BUFFERED) }

# Output GeoJSON of nearby_streets
puts RGeo::GeoJSON.encode(RGeo::GeoJSON::FeatureCollection.new(nearby_streets)).to_json