class Food
  attr_reader :name, :manufacturer, :ndb, :group, :data_source
  def initialize(food_info)
    @name = food_info['name']
    @manufacturer = food_info['manu']
    @ndb = food_info['ndbno']
    @group = food_info['group']
    @data_source = food_info['ds']
  end

end
