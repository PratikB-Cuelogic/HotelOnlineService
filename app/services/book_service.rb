class BookService

  def initialize params
    @params=params
    #puts @params
  end

  def selected_room_booking_details
    room_id = []    
    @params[:room_select].each do |key, value|
      if value != 0.to_s
        room_id << key
      end     
    end
    @room_details = Room.id(room_id).uniq     
    @room_details
  end

  def total_booking_price
    value = @room_details.sum(&:price)
  end

  def get_hotel_id
    Room.select("hotel_id").id(@room_details[0]).uniq   
  end

  def room_hotel_details
    @hotel = get_hotel_id
  	@hotel_details = Hotel.id(@hotel[0][:hotel_id])
  	@hotel_details
  end

  def get_booking_details_booked
    booking = Room.checkin_checkout_eq(@params[:checkin], @params[:checkout])
    booking_details = booking.to_a
  end

  def check_room_booking_availability
    room_booked_details = selected_room_booking_details
    verify_room_booked_details = get_booking_details_booked
    p = true
    if room_booked_details.all?{|z| verify_room_booked_details.include?(z)}
      p = true
    else
      p = false
      create_booking room_booked_details
      return p
    end
  end

  def create_booking room_booked_details
      @book = Booking.create(date: Date.today, checkin: @params[:checkin], checkout: @params[:checkout], member_id: @params[:member])
      @book.rooms << room_booked_details
  end

end
