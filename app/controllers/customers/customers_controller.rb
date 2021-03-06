class Customers::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_customer_path
    else
      render :edit
    end
  end

  # 退会確認
  def unsubscribe
  end

  # 退会処理
  def withdraw
    @customer = current_customer
    if @customer.update(is_active: "退会")
      reset_session
      redirect_to customers_root_path
    else
      render 'edit'
    end
  end

  private
  def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end
end
