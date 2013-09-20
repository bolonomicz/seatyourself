class CustomersController < ApplicationController
  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
		@customer = Customer.find(params[:id])
		if @customer.update_attributes(params[:customer])
			redirect_to @customer
		else
			render 'edit'
		end
	end

  def new
  	@customer = Customer.new
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def create
		@customer = Customer.new(params[:customer])
		if @customer.save
			
			redirect_to root_path, alert: "Account created"
		else
			render "new"
		end
	end


end
