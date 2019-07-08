class USDAFoodsService
  def initialize(food)
    @food = food
  end

  def get_foods
    conn.get
  end

  def key
    ENV['USDA_KEY']
  end

  private

  def conn
    @_conn ||= Faraday.new"Faraday.get(https://api.nal.usda.gov/ndb/search/?format=json&q=#{params['q']}&sort=r&max=10&offset=0&api_key=#{key}")")  do |faraday|
      faraday.adapter Faraday.default_adapter
    end
end
