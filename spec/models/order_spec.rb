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

        it "Should calculate price properly" do
            o = Order.new(
                user_name: "Test user",
                user_password: "Password",
                user_email: "test@exaple.com",
                user_phone_number: "548-858-554"
            )

            pt_subs = ProductType.create!(
                price: 20,
                pr_type: "subscription",
                name: "Teach course"
            )

            pt_serv = ProductType.create!(
                price: 35,
                pr_type: "service",
                name: "Teaching session"
            )

            p1 = Subscription.new(
                start_date: Date.today,
                end_date: Date.today + 7.days,
                product_type: pt_subs
            )

            p2 = Service.new(
                start_time: 9,
                end_time: 12,
                day_of_week: 3,
                number_of_weeks: 2,
                product_type: pt_serv
            )

            o.products << p1
            o.products << p2
            o.save!

            expect(o.total_cost).to eq 310
            
        end

    end
end