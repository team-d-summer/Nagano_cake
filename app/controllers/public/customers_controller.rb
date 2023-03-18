class Public::CustomersController < ApplicationController
    
    def show
    @customer = Customer.find(current_customer.id)
  end 

  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
     flash[:notice] = "変更を保存しました。"
     redirect_to customers_my_page_path(current_customer.id)
    else
     render :edit
    end 
  end
  
  def unsubscribe
  end 
  
  def withdrawal
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :phone_number)
    end
    
    def ensure_current_customer
     if !customer_signed_in?
      redirect_to root_path
     end 
    end 
end
