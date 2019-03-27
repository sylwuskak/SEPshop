require "rails_helper"

describe ProductType do 
    context 'When testing the ProductType class' do 
    
        it "Should not be valid without all of the fields" do
            pt = ProductType.new(
                price: 3.5
            )
            expect(pt.valid?).to be false
        end

        it "Should be valid with all of the fields" do
            pt = ProductType.new(
                price: 3.5,
                pr_type: "subscription",
                name: "Teach course"
            )
            expect(pt.valid?).to be true
        end

    end
end