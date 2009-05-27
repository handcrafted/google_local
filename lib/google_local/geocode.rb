module GoogleLocal
  
  class Geocode
    include Geokit::Geocoders
    Geokit::Geocoders::provider_order = [:google,:us]
    Geokit::Geocoders::google = MAPS_API_KEY
    
    def self.find_latlng(location)
      res=MultiGeocoder.geocode(location)
      res.ll
    end
    
  end
  
end