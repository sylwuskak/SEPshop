class Service < Product
    validates :start_time, :end_time, :day_of_week, :number_of_weeks, presence: true
    validates_with ServiceValidator

    def set_price
        self.price = self.product_type.price * (self.end_time - self.start_time) * self.number_of_weeks
    end

end