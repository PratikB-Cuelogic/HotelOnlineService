class SearchService


  def initialize params
    @params=params
  end

  def search_by_all
    @h = search_available_hotels
  end

  def search_room_booked
    #@r = Room.select("id").joins(:bookings).where("bookings.checkin < :endRangeDate AND bookings.checkout > :startRangeDate", { startRangeDate: @params[:checkinSel] , endRangeDate: @params[:checkoutSel]})
    booking = Room.select("id").checkin_checkout(@params[:checkinSel], @params[:checkoutSel])
  end

  def search_available_hotels
    r = search_room_booked
    h = Hotel.joins(:rooms).name_state_city(@params[:name_or_state_or_city]).room_inactive.room_id_not(r).room_count(@params[:roomSel]).uniq
  end

  def search_available_rooms hotel_id
    r = search_room_booked
    h = Room.room_hotel_id(hotel_id).inactive.room_id_not(r).uniq
    #h = Room.joins(:hotel).where("hotels.id = :col_1 AND rooms.inactive IS NULL AND rooms.id NOT IN (:col_2)" , { col_1: hotel_id , col_2: r} ).group("rooms.id,rooms.price,rooms.no_of_bedroom").uniq    
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
