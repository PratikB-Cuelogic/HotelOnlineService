class SearchService

  def self.search_by_all params
    @h = search_available_hotels params
  end

  def self.search_room_booked params
    booking = Room.select("id").checkin_checkout(params[:checkinSel], params[:checkoutSel])
  end

  def self.search_available_hotels params
    r = search_room_booked params
    h = Hotel.joins(:rooms).name_state_city(params[:name_or_state_or_city]).room_inactive.room_id_not(r).room_count(params[:roomSel]).uniq
  end

  def self.search_available_rooms hotel_id,params
    r = search_room_booked params
    h = Room.room_hotel_id(hotel_id).active.room_id_not(r).uniq
  end

  def self.check_room_sel params
    output = true
    params.each do |k,v|
      if v == 0.to_s
        output = true
      else
        output = false
        return false
      end
    end
    output
  end

end
