#require 'httparty'
class Recipe
  include HTTParty
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'food2fork.com/api'
  base_uri "http://#{hostport}"
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

  def self.for (ingredient)
    begin
      get("/search", query: {q: ingredient})["recipes"]
    rescue Exception => e
      e
    end
  end
end
