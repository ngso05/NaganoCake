class Customers::AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses.page(params[:page])
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to customers_addresses_path
    else
      render :new
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
     @address = Address.find(params[:id])
     if @address.update(address_params)
       redirect_to customers_addresses_path
     else
       render :edit
     end
  end

  def destroy
    @address = Address.find(params[:id])
  	@address.destroy
  	redirect_to customers_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :customer_id, :postal_code, :address)
  end

end
