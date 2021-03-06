class Order < ActiveRecord::Base
    has_many :products, :after_add => :set_price

    validates :user_name, :user_password, :user_email, :user_phone_number, presence: true

    def set_price(product)
        product.set_price
        product.save!

        self.total_cost = self.products.map{|p| p.price.to_i}.sum
    end
end