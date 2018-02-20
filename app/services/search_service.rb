class SearchService


  def initialize params
    @params=params
  end

  def search_by_all
    @h = search_available_hotels
  end

  def search_room_booked
    booking = Room.select("id").checkin_checkout(@params[:checkinSel], @params[:checkoutSel])
  end

  def search_available_hotels
    r = search_room_booked
    h = Hotel.joins(:rooms).name_state_city(@params[:name_or_state_or_city]).room_inactive.room_id_not(r).room_count(@params[:roomSel]).uniq
  end

  def search_available_rooms hotel_id
    r = search_room_booked
    h = Room.room_hotel_id(hotel_id).active.room_id_not(r).uniq
  end

  def check_room_sel
    p = true
    puts @params[:room_select]
    @params[:room_select].each do |k,v|
      if v == 0.to_s
        p = true
      else
        p = false
        return false
      end
    end
    true
  end

end
