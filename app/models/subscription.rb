class Subscription < Product
    validates :start_date, :end_date, presence: true
end