class OwnerSessionsController < ApplicationController
  def new
  end

  def create
    owner = Owner.find_by_email(params[:email])
    if owner && owner.authenticate(params[:password])
      session[:owner_id] = owner.id
      redirect_to owner, :notice => "Logged in!"
    else
    	flash.now[:alert] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:owner_id] = nil
    redirect_to root_path, :notice => "Logged out!"
  end
end
