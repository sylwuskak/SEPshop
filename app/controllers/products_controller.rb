class ProductsController < ApplicationController

    def create
        begin
            o = Order.find params['order_id']
        
            p = if params.keys.include? "subscription"
                Subscription.new(subscription_params)
            elsif params.keys.include? "service"
                Service.new(service_params)
            elsif params.keys.include? "good"
                Good.new(good_params)
            end 
    
            p.price = 0
    
            o.products << p
            o.save!
        rescue => e
            flash[:danger] = "Adding product failure #{e.inspect}"
        end

        redirect_to edit_order_path(o)
    end

    def destroy
        begin
            order = Product.find(params[:id]).order
            Product.destroy(params[:id])
        rescue => e

        end
        redirect_to order_path(order)
    end

    private
    def subscription_params
        params.require(:subscription).permit(:start_date, :end_date, :product_type_id)  
    end

    def service_params
        params.require(:service).permit(:start_time, :end_time, :day_of_week, :number_of_weeks, :product_type_id)
    end

    def good_params
        params.require(:good).permit(:number, :product_type_id)
    end

end