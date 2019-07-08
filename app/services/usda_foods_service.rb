class USDAFoodsService
  def initialize(food)
    @food = food
  end

  def key
    ENV['USDA_KEY']
  end

  def get_foods
  response = conn.get("?q=#{@food}&sort=r&max=10&offset=0&api_key=#{key}")
  json = JSON.parse(response.body)
  json
  end

  private

  def conn
  @_conn = Faraday.new("https://api.nal.usda.gov/ndb/search/?format=json")  do |faraday|
      faraday.adapter Faraday.default_adapter
    end
end

end
