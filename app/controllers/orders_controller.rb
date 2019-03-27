class OrdersController < ApplicationController
    def index
        @orders = Order.all.order(id: :desc)
    end

    def edit 
        @order = Order.find params["id"]
    end

    def new
    
    end

    def create
        begin
            o = Order.new(order_params)
            o.save!
            redirect_to order_path(o)
        rescue => e
            flash[:danger] = "Order saving failed"
            redirect_to new_order_path
        end
      
    end

    def update
        begin    
            @order = Order.find(params[:id])
            @order.update!(edit_order_params)
            redirect_to orders_path
        rescue => e
            flash[:danger] = "Order update'ing failure"
            redirect_to order_path(o)
        end
          
    end

    private

    def order_params
        permit_params = params.require(:order).permit(:user_name, :user_password, :user_email, :user_phone_number)
    end

    def edit_order_params
        permit_params = params.require(:order).permit(:user_name, :user_password, :user_email, :user_phone_number)
    end

end