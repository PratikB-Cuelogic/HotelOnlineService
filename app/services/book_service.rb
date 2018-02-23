
class BookService

  def self.selected_room_booking_details params
  #To create array of selected rooms for booking
    room_id = []    
    params[:room_select].each do |key, value|
      if value != 0.to_s
        room_id << key
      end
    end
    room_details = Room.id(room_id).uniq
    room_details
  end

  def self.total_booking_price room_details
  #To return sum of total room price
    value = room_details.sum(&:price)
  end

  def self.get_hotel_id room_details
  #To return hotel id corresponding to room
    Room.select("hotel_id").id(room_details[0]).uniq
  end

  def self.room_hotel_details room_details
  #to return hotel details
    hotel = get_hotel_id room_details
    hotel_details = Hotel.id(hotel[0][:hotel_id])
    hotel_details
  end

  def self.get_booking_details_booked  params
  #To return details of room which are booked
    booking = Room.checkin_checkout_eq(params[:checkin], params[:checkout])
    booking_details = booking.to_a
  end

  def self.check_room_booking_availability params
  #to verify whether booking of that corresponding rooms are made or not
    room_booked_details = selected_room_booking_details params
    verify_room_booked_details = get_booking_details_booked params
    output = true
    if room_booked_details.all?{|z| verify_room_booked_details.include?(z)}
      output = true
    else
      output = false
      create_booking room_booked_details,params
      return output
    end
  end

  def self.create_booking room_booked_details,params
  #to create booking of those selected rooms
      book = Booking.create(date: Date.today, checkin: params[:checkin], checkout: params[:checkout], member_id: params[:member])
      book.rooms << room_booked_details
      if book.save
        send_booking_mail book
        CustomLogger.booking_log book
      end
  end

  def self.send_booking_mail booking
  #to send email to member about the booking
    MemberMailer.booking_email(booking).deliver_later
  end
end
