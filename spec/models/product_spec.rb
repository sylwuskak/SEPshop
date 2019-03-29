require "rails_helper"

describe Product do 
    o = Order.new(
        user_name: "Test user",
        user_password: "Password",
        user_email: "test@exaple.com",
        user_phone_number: "548-858-554"
    )

    pt_subs = ProductType.new(
        price: 20,
        pr_type: "subscription",
        name: "Teach course"
    )

    pt_serv = ProductType.new(
        price: 35,
        pr_type: "service",
        name: "Teaching session"
    )

    pt_good = ProductType.new(
        price: 35,
        pr_type: "good",
        name: "A book"
    )
    
    context 'When testing the Subscription class' do 
    
        it "Should not be valid without all of the fields" do
            s = Subscription.new(
                start_date: Date.today
            )
            expect(s.valid?).to be false
        end

        it "Should be valid with all of the fields" do

            s = Subscription.new(
                start_date: Date.today,
                end_date: Date.today + 7.days,
                order: o,
                product_type: pt_subs
            )
            expect(s.valid?).to be true
        end

        it "Should not be valid with end date smaller than start date" do

            s = Subscription.new(
                start_date: Date.today,
                end_date: Date.today - 7.days,
                order: o,
                product_type: pt_subs
            )
            expect(s.valid?).to be false
        end

        it "Should calculate the price properly" do 
            s = Subscription.new(
                start_date: Date.today,
                end_date: Date.today + 7.days,
                order: o,
                product_type: pt_subs
            )

            expect(s.set_price).to eq 100

        end

    end

    context 'When testing the Service class' do 
    
        it "Should not be valid without all of the fields" do
            s = Service.new(
                start_time: Date.today
            )
            expect(s.valid?).to be false
        end

        it "Should be valid with all of the fields" do

            s = Service.new(
                start_time: 9,
                end_time: 12,
                day_of_week: 4,
                number_of_weeks: 6,
                order: o,
                product_type: pt_serv
            )
            expect(s.valid?).to be true
        end

        it "Should be not valid with wrong start time" do
            s = Service.new(
                start_time: 7,
                end_time: 12,
                day_of_week: 4,
                number_of_weeks: 6,
                order: o,
                product_type: pt_serv
            )
            expect(s.valid?).to be false
        end

        it "Should be not valid with wrong end time" do
            s = Service.new(
                start_time: 9,
                end_time: 20,
                day_of_week: 4,
                number_of_weeks: 6,
                order: o,
                product_type: pt_serv
            )
            expect(s.valid?).to be false
        end

        it "Should not be valid with wrong day of week" do
            s = Service.new(
                start_time: 9,
                end_time: 12,
                day_of_week: 8,
                number_of_weeks: 6,
                order: o,
                product_type: pt_serv
            )
            expect(s.valid?).to be false
        end

        it "Should not be valid with end time smaller than start time" do
            s = Service.new(
                start_time: 15,
                end_time: 12,
                day_of_week: 8,
                number_of_weeks: 6,
                order: o,
                product_type: pt_serv
            )
            expect(s.valid?).to be false
        end

        it "Should calculate the price properly" do 
            s = Service.new(
                start_time: 9,
                end_time: 12,
                day_of_week: 3,
                number_of_weeks: 2,
                order: o,
                product_type: pt_serv
            )

            expect(s.set_price).to eq 210

        end

    end

    context 'When testing the Good class' do 
    
        it "Should not be valid without all of the fields" do
            g = Good.new(
                number: 3
            )
            expect(g.valid?).to be false
        end

        it "Should be valid with all of the fields" do

            g = Good.new(
                number: 3,
                order: o,
                product_type: pt_good
            )
            expect(g.valid?).to be true
        end

        it "Should calculate the price properly" do 

            g = Good.new(
                number: 2,
                order: o,
                product_type: pt_good
            )
        
            expect(g.set_price).to eq 70 
        end

        it 'Should not be valid with wrong product type' do 
            g = Good.new(
                number: 3,
                order: o,
                product_type: pt_serv
            )
            expect(g.valid?).to be false
        end

    end

end