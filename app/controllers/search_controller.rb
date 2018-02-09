class SearchController < ApplicationController
  def index
  	@search=Search.new
  end

  def new

  end

  def search
  	render plain: params[:q].inspect
    @search=SearchService.new(params[:q])
    @result=@search.search_by_all  
    @result.inspect
  end

  def search_by_city(city)
    puts "qqq"
    @result=@search.search_by_city(city)
  end


end
