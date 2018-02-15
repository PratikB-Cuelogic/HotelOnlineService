class SearchController < ApplicationController

  def set_session params
    session[:checkin] = params[:checkinSel]
    session[:checkout] = params [:checkoutSel]
  end

  def search
    set_session params[:search]
    @search = initialize_search_service params[:search]
    @result = @search.search_by_all
    @res = Kaminari.paginate_array(@result).page(params[:page]).per(1)
  end

  def show
    if request.path == '/search/search'
      @res = search
      render action: 'search'
    else 
      if request.path == "/search/search_list"
        @search = initialize_search_service params
        if @search.check_room_sel
          flash[:alert] = "None of the room selected for booking. Please Select Rooms"
          redirect_to request.referer
        else
          redirect_to booking_index_path(room_select: params[:room_select].permit!, checkin: session[:checkin], checkout: session[:checkout])
        end        
      else
        search = { :checkinSel => session[:checkin] , :checkoutSel => session[:checkout]}
        hotel_id = params[:id]
        @search = initialize_search_service search
        @rooms = @search.search_available_rooms(hotel_id)
        @rooms_page = Kaminari.paginate_array(@rooms).page(params[:page])
      end
    end
  end

  def initialize_search_service params
    @search = SearchService.new(params)
  end

end
