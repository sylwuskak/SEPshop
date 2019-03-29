class ProductValidator < ActiveModel::Validator

    def validate(record)
        
        if record.product_type&.pr_type&.upcase != record.type.upcase
            record.errors.add :base, 'Wrong product type'
        end

    end
end