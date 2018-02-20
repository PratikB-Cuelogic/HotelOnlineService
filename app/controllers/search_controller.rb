class SearchController < ApplicationController

  def set_session params
    session[:checkin] = params[:checkinSel]
    session[:checkout] = params [:checkoutSel]
  end

  def search_hotels
    set_session room_params
    @search = initialize_search_service room_params
    @result = @search.search_by_all
    @res = Kaminari.paginate_array(@result).page(params[:page]).per(1)
  end

  def search_list
    @search = initialize_search_service params
    if @search.check_room_sel
      flash[:alert] = "None of the room selected for booking. Please Select Rooms"
      redirect_to request.referer
    else
      puts "sdffd"
      redirect_to booking_index_path(room_select: params[:room_select].permit!)
    end            
  end

  def show
      search = {:checkinSel => session[:checkin],:checkoutSel => session[:checkout]}
      hotel_id = params[:id]
      @search = initialize_search_service search
      @rooms = @search.search_available_rooms(hotel_id)
      @rooms_page = Kaminari.paginate_array(@rooms).page(params[:page])
  end

  def initialize_search_service params
    @search = SearchService.new(params)
  end

  def room_params
    puts "ssss"
     params.require(:search).permit(:name_or_state_or_city,:checkinSel,:checkoutSel,:roomSel)
  end

end
