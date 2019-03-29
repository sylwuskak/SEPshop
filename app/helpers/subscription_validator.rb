class SubscriptionValidator < ActiveModel::Validator

    def validate(record)
        
        if !record.start_date.nil? && !record.end_date.nil? && (record.start_date > record.end_date)
            record.errors.add :base, 'Start date cannot be larger than end date'
        end
    end
end