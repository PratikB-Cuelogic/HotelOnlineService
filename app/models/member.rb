class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  email_regex= /\A[a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9]+(\.[a-z0-9]+)*(\.[a-z]{2,3})\z/
  password_regex= /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}\z/ 
  mobile_regex=/\A[0-9]{10}\z/
  validates :firstname,:lastname, length: { in: 3..20 }, :on => :create
  validates :mobile_no , format: {with: mobile_regex},:on => :create
  validates :email, format:{ with: email_regex}
  validates :password, confirmation: true, format:{with: password_regex}, :on => :signup
  validates :password_confirmation, presence: true, :on => :signup
end