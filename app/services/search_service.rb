class SearchService


  def initialize(params)
    @params=params
    puts @params
  end

  def search_by_all
  	puts "111111"
  	puts @params
  	#@search = Hotel.ransack(@params)
  	#@rb = @search.result.joins(:rooms).where(:rooms => {inactive: nil}).to_a.uniq
    #puts @rb.inspect
    @r = Room.select("id").joins(:bookings).where("bookings.checkin < :endRangeDate AND bookings.checkout > :startRangeDate", { startRangeDate: @params[:checkin_eq] , endRangeDate: @params[:checkout_not_eq]})
    @h = Hotel.joins(:rooms).where("((hotels.name ILIKE :col_1 OR hotels.state ILIKE :col_1) OR hotels.city ILIKE :col_1) AND rooms.inactive IS NULL AND rooms.id NOT IN (:col_2)" , { col_1: @params[:name_or_state_or_city_start]+'%' , col_2: @r} ).group("hotels.id").having(" count(rooms.id) >= ?", @params[:roomSel]).uniq
    puts @h.inspect
=begin	@search = Room.ransack(@params)
  	@rb = @search.result.joins(:hotel,:bookings).where(:rooms => {inactive: nil}, :room_bookings => {checkin: @params[:checkin_eq],checkout: @params[:checkout_not_eq]}).uniq
    puts @rb.inspect
=end
  end

end
