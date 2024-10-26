class User < ApplicationRecord
  validates :first_name, presence: true, 
    length: {minimum:2, maximum: 15}
  validates :last_name, presence: true, 
    length: {minimum:1, maximum: 15}
  validates :email, presence: true, 
    format:{ with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email format" }
  validates :phone_number, presence: true, 
    numericality: {only_integer: true, message: "must be a integer"}, 
    length: {is:10, message: "must be 10 digits long"}
end
