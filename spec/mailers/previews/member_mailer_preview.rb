# Preview all emails at http://localhost:3000/rails/mailers/member_mailer
class MemberMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    MemberMailer.booking_email(Booking.last)
  end
end
