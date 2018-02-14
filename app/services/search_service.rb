class SearchService


  def initialize(params)
    @params=params
    puts @params
  end

  def search_by_all
    @h = search_available_hotels
    return @h
  end

  def search_room_booked
    @r = Room.select("id").joins(:bookings).where("bookings.checkin < :endRangeDate AND bookings.checkout > :startRangeDate", { startRangeDate: @params[:checkinSel] , endRangeDate: @params[:checkoutSel]})
  end

  def search_available_hotels
    r = search_room_booked
    h = Hotel.joins(:rooms).where("((hotels.name ILIKE :col_1 OR hotels.state ILIKE :col_1) OR hotels.city ILIKE :col_1) AND rooms.inactive IS NULL AND rooms.id NOT IN (:col_2)" , { col_1: @params[:name_or_state_or_city]+'%' , col_2: r} ).group("hotels.id").having(" count(rooms.id) >= ?", @params[:roomSel]).uniq
  end

  def search_available_rooms hotel_id
    r = search_room_booked
    h = Room.joins(:hotel).where("hotels.id = :col_1 AND rooms.id NOT IN (:col_2)" , { col_1: hotel_id , col_2: r} ).group("rooms.id,rooms.price,rooms.no_of_bedroom").uniq    
  end


end
