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
    usda_food_service = USDAFoodsService.new(params['q'])
    json = usda_food_service.get_foods
    @food_presenter = FoodIndexFacade.new(json)
  end
end
