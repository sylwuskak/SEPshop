require "rails_helper"

describe Order do 
    context 'When testing the Quota class' do 
    
        it "Should not be valid without all of the user fields" do
            
            q = Order.new(
                user_name: "Test user"
            )
            expect(q.valid?).to be false
        end

        it "Should be valid with all of the user fields" do
            q = Order.new(
                user_name: "Test user",
                user_password: "Password",
                user_email: "test@exaple.com",
                user_phone_number: "548-858-554"
            )

            expect(q.valid?).to be true
        end

    end
end