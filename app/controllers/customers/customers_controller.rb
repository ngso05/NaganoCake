class Customers::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_customer_path
    else
      render :edit
    end
  end

  def unsubscribe

  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_active: "退会")
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end
end
