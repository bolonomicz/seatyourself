class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_owner
    @current_owner ||= Owner.find(session[:owner_id]) if session[:owner_id]
  end

  helper_method :current_owner
end
