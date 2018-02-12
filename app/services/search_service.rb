class SearchService


  def initialize(params)
    @params=params
    puts @params
  end

  def search_by_all
  	puts "111111"
  	puts @params
  	@search = Hotel.ransack(@params)
  	@rb = @search.result.joins(:rooms).where(:rooms => {inactive: nil}).to_a.uniq
    puts @rb.inspect
  
=begin	@search = Room.ransack(@params)
  	@rb = @search.result.joins(:hotel,:bookings).where(:rooms => {inactive: nil}, :room_bookings => {checkin: @params[:checkin_eq],checkout: @params[:checkout_not_eq]}).uniq
    puts @rb.inspect
=end
  end

end
