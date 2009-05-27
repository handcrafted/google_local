module GoogleLocal
  
  # Geocoding to fetch the latitude/longitude of a location string
  class Geocode
    include Geokit::Geocoders
    Geokit::Geocoders::provider_order = [:google,:us]
    Geokit::Geocoders::google = MAPS_API_KEY
    
    # A request to the geocoding service to fetch the latitude/longitude of a location string
    def self.find_latlng(location)
      res=MultiGeocoder.geocode(location) # Get the geocoding response
      res.ll # Return the lat/lng
    end
    
  end
  
end