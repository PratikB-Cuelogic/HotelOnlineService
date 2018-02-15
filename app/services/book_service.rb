class BookService

  def initialize params
    @params=params
    puts @params
  end

  def selected_room_booking_details
  	@room_details = []
  	@params[:room_select].each do |key, value|
	  if value != 0.to_s
		@result = Room.id(key).uniq
  		@hotel = Room.select("hotel_id").id(@result).uniq		
		@room_details << @result
	  end  		
  	end
  	@room_details
  end

  def total_booking_price
  	value = 0
  	@room_details.each do |room|
    	value += room.sum(&:price)
	end
	value
  end

  def room_hotel_details
  	@hotel_details = Hotel.id(@hotel[0][:hotel_id])
  	@hotel_details
  end

end
