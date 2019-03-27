class ServiceValidator < ActiveModel::Validator

    def validate(record)
        
        if record.start_time.to_i > record.end_time.to_i
            record.errors.add :base, 'Start time cannot be larger than end time'
        end

        if record.start_time.to_i < 9
            record.errors.add :base, 'Start time must be greater or equal 9 am.'
        end

        if record.end_time.to_i > 19
            record.errors.add :base, 'Start time must be smaller or equal 17 pm.'
        end
        
        if !((1..5).to_a.include? record.day_of_week.to_i )
            record.errors.add :base, 'Wrong day of the week'
        end
    end
end