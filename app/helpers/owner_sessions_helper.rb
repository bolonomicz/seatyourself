module OwnerSessionsHelper

	def signed_in_owner
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
end
