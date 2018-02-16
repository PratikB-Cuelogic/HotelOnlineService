class BookingController < ApplicationController
  def index
  	session[:rooms_details] = params[:room_select]
  	@booking = BookService.new params
  	@rooms_details = @booking.selected_room_booking_details
  	@hotel_details = @booking.room_hotel_details
  	@booking_price = @booking.total_booking_price
  end

  def create  	
  	#session[:member] = current_member.id
  	params = { :room_select => session[:rooms_details], :checkin => session[:checkin], :checkout => session[:checkout], :member => session[:member]}
  	@booking = BookService.new params
  	if @booking.check_room_booking 	
		flash[:alert] = "Booking has been Done already"
		redirect_to '/home/index'  	
	else
  	 	flash[:notice] = "Booking Done"
  		redirect_to '/home/index'  	
	end  		  	
  end

  def details
  	@q = Booking.ransack(params[:q])
  	@result = @q.result(distinct: true).where(member_id: session[:member])
  	@details_result = Kaminari.paginate_array(@result).page(params[:page]).per(2)
  end
end
