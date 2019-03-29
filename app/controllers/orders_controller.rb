class OrdersController < ApplicationController
    def index
        @orders = Order.all.order(id: :desc)    
    end

    def edit 
        @order = Order.find params["id"]
        @products = @order.products.includes(:product_type)
        @days_of_week = [
            ["Monday", 1],
            ["Tuesday", 2],
            ["Wednesday", 3],
            ["Thursday", 4],
            ["Friday", 5],
            ["Saturday", 6],
            ["Sunday", 7]
        ]
    end

    def new
    
    end

    def create
        begin
            o = Order.new(order_params)
            o.save!
            redirect_to edit_order_path(o)
        rescue => e
            flash[:danger] = "Order saving failed  #{e.inspect}"
            redirect_to new_order_path
        end
    end

    def update
        @order = Order.find(params[:id])
        begin
            @order.update!(edit_order_params)
            flash[:success] = "Order update"
            redirect_to edit_order_path(@order)
        rescue => e
            flash[:danger] = "Order updating failure #{e.inspect}"
            redirect_to edit_order_path(@order)
        end
    end

    def destroy
        begin
            Order.destroy(params[:id])
            redirect_to orders_path
        rescue => e 
            flash[:danger] = "Order deleting failure #{e.inspect}"
            redirect_to edit_order_path(params[:id])
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