class CustomLogger

  def self.booking_log booking
    puts "sdsdsdd"
    @log = File.open("log/booking_log.log", "ab")
    booking_detail_log = booking.member_id, booking.id, booking.date, booking.checkin, booking.checkout
    @log.print(booking_detail_log)
    @log.write("\n")
  end

  def self.login_log member
    puts "sss"
    @log = File.open("log/login_log.log", "ab")
    member_login_log = member.firstname+" "+member.lastname,member.email,member.mobile_no,member.current_sign_in_at
    @log.write(member_login_log)
    @log.write("\n")
  end

end