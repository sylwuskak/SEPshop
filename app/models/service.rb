class Service < Product
    validates :start_time, :end_time, :day_of_week, :number_of_weeks, presence: true
    validates_with ServiceValidator
end