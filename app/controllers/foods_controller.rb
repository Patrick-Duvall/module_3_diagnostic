class FoodsController < ApplicationController
  def index

    conn = Faraday.get("https://api.nal.usda.gov/ndb/search/?format=json&q=#{params['q']}&sort=n&max=10&offset=0&api_key=lg6h9g1vaB3tS1nGB9JmRAYzddGGus1AL1eCNJcT")
    require "pry"; binding.pry
  end
end
