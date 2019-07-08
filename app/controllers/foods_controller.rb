class FoodIndexFacade

  def initialize(json)
    @json = json
  end

  def count
    @json['list']['total']
  end

  def foods
    food_infos = @json['list']['item']
    foods = []
    food_infos.each do |food_info|
      foods << Food.new(food_info)
    end
    foods
  end
end


class FoodsController < ApplicationController
  def index
    conn = Faraday.get("https://api.nal.usda.gov/ndb/search/?format=json&q=#{params['q']}&sort=r&max=10&offset=0&api_key=lg6h9g1vaB3tS1nGB9JmRAYzddGGus1AL1eCNJcT")
    json = JSON.parse(conn.body)
    count = json['list']['total']
    @food_presenter = FoodIndexFacade.new(json)
  end
end
