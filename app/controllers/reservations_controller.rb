class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def index
    @reservations = Reservation.all
  end

  def create
    @reservation = current_customer.reservations.build (params[:reservation])
    if @reservation.save
      redirect_to reservation_path(@reservation)
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
      redirect_to @reservation
    else
      render 'edit'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path, notice: "reseravation cancelled"
  end
end
