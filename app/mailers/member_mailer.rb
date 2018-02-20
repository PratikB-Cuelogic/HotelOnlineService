class MemberMailer < ApplicationMailer
  default from: "from@example.com"

  def booking_email(booking)
    @booking = booking
    @member = Member.find_by_id(@booking.member_id)
    @rooms = @booking.rooms.to_a
    @count =@rooms.count
    @price = @rooms.sum(&:price)
    @hotel = Hotel.find_by_id(@rooms[0].hotel_id)
    mail(to: @member.email, subject: 'Go Booking Details')
  end

end
