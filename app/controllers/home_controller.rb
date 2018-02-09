class HomeController < ApplicationController
  def index
  	@hotel_by_cities=Hotel.select("city").group(:city).limit(6)
  end

  def new
  end

end
