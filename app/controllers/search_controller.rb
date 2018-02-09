class SearchController < ApplicationController
  def index
  	@search=Search.new
  end

  def new

  end

  def search
  	render plain: params[:search].inspect
    @search = Hotel.search(params[:search])
    puts @search.inspect
=begin  	@search=SearchService.new(params[:search])
    @result=@search.search_by_all
=end
  end

  def search_by_city(city)
    @result=@search.search_by_city(city)
  end


end
