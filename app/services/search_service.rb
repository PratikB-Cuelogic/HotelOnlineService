class SearchService

  def self.search_by_all params
    #to search hotel by the given inputs
    @h = search_available_hotels params
  end

  def self.search_room_booked params
    #to return the list of room_details which are booked on given checkin checkout date
    booking = Room.select("id").checkin_checkout(params[:checkinSel], params[:checkoutSel])
  end

  def self.search_available_hotels params
    #to search and return the list of hotels by the given output from search_room_booked
    r = search_room_booked params
    h = Hotel.joins(:rooms).name_state_city(params[:name_or_state_or_city]).room_inactive.room_id_not(r).room_count(params[:roomSel]).uniq
  end

  def self.search_available_rooms hotel_id,params
    #to return the list of rooms available on given checkin checkout date and its corresponding email id
    r = search_room_booked params
    h = Room.room_hotel_id(hotel_id).active.room_id_not(r).uniq
  end

  def self.check_room_sel params
    #to check whether any rooms are been selected or not
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
