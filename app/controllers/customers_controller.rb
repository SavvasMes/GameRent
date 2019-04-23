class CustomersController < ApplicationController
  def index
    @customers = Customer.page params[:page]
  end

  def new
    @customer = Customer.new
    render :edit
  end

  def create
    @customer = Customer.new customer_params

    if @customer.save
      redirect_to customers_path, notice: 'Customer Saved'
    else
      render :edit
    end
  end

  def edit
    @customer = Customer.find params[:id]
  end

  def update
    @customer = Customer.find params[:id]

    if @customer.update_attributes customer_params
      flash[:notice] = "Customer Updated <b>successfully!</b>"
      redirect_to customers_path
    else
      render :edit
    end
  end

  def destroy
    @customer = Customer.find params[:id]
    @customer.destroy
    flash.now[:notice] = "Customer deleted <b>successfully!</b>"
    redirect_to customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :uid, :birthdate)
  end
end
