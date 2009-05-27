module GoogleLocal
  
  class Search
    include HTTParty
    
    base_uri "http://ajax.googleapis.com/ajax/services/search"
    default_params :v => '1.0'
    attr_accessor :center_location, :api_key, :latlng
    
    def initialize(center_location, api_key=nil)
      @api_key = api_key
      @latlng = GoogleLocal::Geocode.find_latlng(center_location)
    end
    
    def find(query,options={})
      options.merge!(:q => query, :sll => @latlng)
      fetch_locations(self.class.get("/local", :query => options))
    end
    
    private
    
    def fetch_locations(response)
      response['responseData']['results'].flatten.collect {|r| Mash.new(r) }
    end
    
  end
  
end