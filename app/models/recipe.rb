class Recipe
  include HTTParty
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'food2fork.com/api'
  #base_uri "http://#{hostport}"
  base_uri = 'http://food2fork.com:80/api'
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

  def self.for(ingredient = "chocolate")
    # issues an HTTP GET request using the HTTParty gem
    # the HTTP GET request must have the "q=keyword" query argument and query "/search" route
    # returns the JSON payload document supplied in the recipes element of the hash returned by HTTParty
    recipes_returned = get("/search", query: {q: ingredient})["recipes"]
    #Array(chocolates)
  end

end
