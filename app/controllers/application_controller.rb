class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_owner
    @current_owner ||= Owner.find(session[:owner_id]) if session[:owner_id]
    rescue ActiveRecord::RecordNotFound
  end
 
 def current_customer
 	@current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
 end
  helper_method :current_owner, :current_customer



end
