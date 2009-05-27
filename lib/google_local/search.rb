module GoogleLocal
  
  # A search sent to Google Local Search RESTful API
  class Search
    include HTTParty
    
    base_uri "http://ajax.googleapis.com/ajax/services/search"
    default_params :v => '1.0'
    
    # Central location for the local search
    attr_accessor :center_location
    
    # Google Search API Key
    attr_accessor :api_key
    
    # The latitude and longitude of the central location
    attr_accessor :latlng
    
    def initialize(center_location, api_key=nil)
      @api_key = api_key
      @latlng = GoogleLocal::Geocode.find_latlng(center_location) # Parse center_location into latitude and longitude
    end
    
    # Perform a Google Local search given a query.
    def find(query,options={})
      options.merge!(:q => query, :sll => @latlng) # Merge in the query and the lat/lng into the options
      fetch_locations(self.class.get("/local", :query => options)) # Make the get request
    end
    
    private
    
    def fetch_locations(response)
      response['responseData']['results'].flatten.collect {|r| Mash.new(r) }
    end
    
  end
  
end