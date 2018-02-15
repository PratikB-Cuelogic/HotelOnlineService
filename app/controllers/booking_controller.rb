class BookingController < ApplicationController
  def index
  	@booking=BookService.new params
  	@rooms_details = @booking.selected_room_booking_details
  	@hotel_details = @booking.room_hotel_details
  	@booking_price = @booking.total_booking_price
  	#puts @rooms_details.to_a  	
  end
end
