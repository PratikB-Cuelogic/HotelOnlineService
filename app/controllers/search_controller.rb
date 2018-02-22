class SearchController < ApplicationController
  def set_cache params
    Rails.cache.write("checkout",params[:checkoutSel])
    Rails.cache.write("checkin",params[:checkinSel])
  end

  def search_hotels
    set_cache room_params
    @result = SearchService.search_by_all room_params
    @res = Kaminari.paginate_array(@result).page(params[:page]).per(2)
  end

  def search_list
    if SearchService.check_room_sel room_select_params
      flash[:alert] = "None of the room selected for booking. Please Select Rooms"
      redirect_to request.referer
    else
      puts "sdffd"
      redirect_to booking_index_path(room_select: room_select_params)
    end            
  end

  def show
      checkin = Rails.cache.read("checkin")
      checkout = Rails.cache.read("checkout")
      puts checkin
      search = {:checkinSel => checkin,:checkoutSel => checkout}
      hotel_id = params[:id]
      @rooms = SearchService.search_available_rooms hotel_id,search
      @rooms_page = Kaminari.paginate_array(@rooms).page(params[:page])
  end

  def room_params
    puts "ssss"
     params.require(:search).permit(:name_or_state_or_city,:checkinSel,:checkoutSel,:roomSel)
  end

  def room_select_params
    params.require(:room_select).permit!
  end

end
