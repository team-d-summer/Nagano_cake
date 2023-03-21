class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def comfirm
    @carts = current_customer.cart_items
    @total = @carts.inject(0) {|sum, cart| sum + cart.add_total_payment_all}
    @order = current_customer.orders.new(order_params)
    @order.shipping_cost = 800
    select_destination(params[:order][:option])
    
    unless @order.save
      flash.now[:alert] = "注文情報の入力に誤りがあります。もう一度確認してください。"
      render :new
    end
    
  end
  
  def create
    order = current_customer.orders.new(order_params)
    order.status = 0
    order.save
    current_customer.cart_items.each do |cart_item|
      OrderDetail.create(
        order_id: order.id,
        item_id: cart_item.item_id,
        price: cart_item.item.price,
        amount: cart_item.amount,
        making_status: 0
      )
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders
    @carts = current_customer.cart_items
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  private
    def order_params
      params.require(:order).permit(
        :postal_code,
        :address,
        :name,
        # 送料
        :shipping_cost,
        # 請求額
        :total_payment,
        # 支払い方法
        :payment_method
        )
    end
    def select_destination(option)
      case option
        when '0'
          @order.postal_code = current_customer.postal_code
          @order.address = current_customer.address
          @order.name = current_customer.add_full_name
        when '1'
          del = Address.find(params[:order][:address_id])
          @order.postal_code = del.postal_code
          @order.address = del.address
          @order.name = del.name
        when '2'
          @order.postal_code = params[:order][:order_postal_code]
          @order.address = params[:order][:order_address]
          @order.name = params[:order][:other_name]
      end
    end
end
