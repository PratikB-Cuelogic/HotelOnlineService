class SearchController < ApplicationController
  def index
  	@search=Search.new
  end

  def new

  end

  def set_session params
    session[:checkin] = params[:checkinSel]
    session[:checkout] = params [:checkoutSel]
  end

  def search
    set_session params[:search]
    @search = initialize_search_service params[:search]
    puts params[:search].class
    @result = @search.search_by_all
    @res = Kaminari.paginate_array(@result).page(params[:page]).per(1)
  end

  def show
    puts request.path
    if request.path == '/search/search'
      @res = search
      render action: 'search'
    else 
      if request.path == "/search/search_list"
      render action: search_list
      else
      search = { :checkinSel => session[:checkin] , :checkoutSel => session[:checkout]}
      hotel_id = params[:id]
      @search = initialize_search_service search
      @hotel = Hotel.find(hotel_id) 
      @rooms = @search.search_available_rooms(hotel_id)
      @rooms_page = Kaminari.paginate_array(@rooms).page(params[:page])
    end
  end
  end

  def initialize_search_service params
    @search = SearchService.new(params)
  end

  def search_list
    puts "dsadad"
#    render plain: params.inspect
  end

end
