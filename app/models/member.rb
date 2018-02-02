class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  email_regex= /\A[a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9]+(\.[a-z0-9]+)*(\.[a-z]{2,3})\z/
  password_regex= /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}\z/ 
  mobile_regex=/\A[0-9]{10}\z/
  name_regex=/\A[a-z][a-zA-Z]+\z/
  validates :firstname,:lastname, :presence => true, length: { in: 3..20 }, format: {with: name_regex, message: "contains only alphabets"}
  validates :mobile_no, :presence => true, format: {with: mobile_regex}
  #validates :email,:presence => true, format:{ with: email_regex}
  #validates :password, :presence => true
  #validates :password_confirmation,:presence => true
end