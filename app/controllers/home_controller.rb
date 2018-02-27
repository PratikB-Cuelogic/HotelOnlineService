class HomeController < ApplicationController
  def index
  	@hotel_by_cities= Rails.cache.fetch('hotels'){Hotel.select("city").group(:city).limit(9)}
  end
end
