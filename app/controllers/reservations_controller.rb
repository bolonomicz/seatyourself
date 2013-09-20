class ReservationsController < ApplicationController
  def new
     @restaurant = Restaurant.find(params[:restaurant_id])
     @reservation = @restaurant.reservations.build(params[:reservation])
  end
  
  def index
    @reservations = Reservation.all
  end
  
  def create
    #@customer = Customer.find(params[:customer_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(params[:reservation]) 
    #@reservation = @customer.reservations.build(params[:reservation])
    #@reservation.customer = current_customer
    if @reservation.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(params[:reservation])
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to root_path, notice: "restaurant deleted"
  end
end
