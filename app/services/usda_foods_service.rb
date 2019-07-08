class USDAFoodsService
  def initialize(food)
    @food = food
  end

  def key
    ENV['USDA_KEY']
  end

  def get_foods
  conn = Faraday.get("https://api.nal.usda.gov/ndb/search/?format=json&q=#{@food}&sort=r&max=10&offset=0&api_key=#{key}")
  json = JSON.parse(conn.body)
  json
  end

end
