class MemberMailer < ApplicationMailer
  default from: "from@example.com"

  def booking_email(booking)
  	puts booking.inspect
    @booking = booking
    @member = Member.find_by_id(@booking.member_id)
    puts @member.inspect
    @rooms = @booking.rooms.to_a
    puts @rooms.inspect
    @count =@rooms.count
    @price = @rooms.sum(&:price)
    @hotel = Hotel.find_by_id(@rooms[0].hotel_id)
    mail(to: @member.email, subject: 'Go Booking Details')
  end

end
