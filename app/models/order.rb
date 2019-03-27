class Order < ActiveRecord::Base
    has_many :products

    validates :user_name, :user_password, :user_email, :user_phone_number, presence: true
end