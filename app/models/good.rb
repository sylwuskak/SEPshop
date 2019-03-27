class Good < Product
    validates :number, presence: true

    def set_price
        self.price = self.product_type.price * self.number
    end
end