class Subscription < Product
    validates :start_date, :end_date, presence: true
    validates_with SubscriptionValidator

    def set_price
        self.price = self.product_type.price * self.business_days
    end

    def business_days
        business_days = 0
        date = self.end_date
        while date > self.start_date
         business_days = business_days + 1 unless date.saturday? or date.sunday?
         date = date - 1.day
        end
        business_days
    end
end