class BookingController < ApplicationController
  def index
    Rails.cache.write('rooms_details',params[:room_select])
  	@rooms_details = BookService.selected_room_booking_details params
  	@hotel_details = BookService.room_hotel_details @rooms_details
  	@booking_price = BookService.total_booking_price @rooms_details
  end

  def create  	
    if current_member.nil?
		  flash[:alert] = 'Member is not logged in and booking has been done already'
		  redirect_to '/home/index'  	
	  else
      room_ids = Rails.cache.read('rooms_details')
      checkin = Rails.cache.read('checkin')
      checkout = Rails.cache.read('checkout')      
	    params = { :room_select => room_ids, :checkin => checkin, :checkout => checkout, :member => session[:member]}
	    if BookService.check_room_booking_availability params
		    flash[:alert] = 'Booking has been done already'
		  else
  	    flash[:notice] = 'Booking Done'
		  end  		  	
      redirect_to '/home/index'
    end
  end

  def details
    @q = Booking.ransack(params[:q])
    @result = @q.result(distinct: true).where(member_id: session[:member]) 
    @details_result = Kaminari.paginate_array(@result).page(params[:page]).per(10)
  end

  def destroy
    @booking=Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = 'Your Booking has been Cancelled'
    redirect_to booking_details_path
  end
end
