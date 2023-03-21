class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    # @total = 0
    # @totals = @carts.inject(0) {|sum, cart| sum + cart.add_total_payment_all}
    # @order_details.each do |order_detail|
    #   @total+=order_detail.amount*order_detail.price
    # end
  end

  def update
      @order = Order.find(params[:id])
      @order.update(order_params)
   if @order.status == "payment_confirmation"
      @order_detail = @order.order_details
      @order_detail.update_all(making_status:'waiting_production')
   end
      redirect_back(fallback_location: admin_order_path)
  end

  private

  def order_params
    params.require(:order).permit(:status, :order_detail)
  end
end
