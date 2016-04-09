class LocationsController < ApplicationController
  def new
  end

  def index
  	client_id = session["warden.user.client.key"][0][0]
  	@locations = Client.find(client_id).locations
  end

  def create
  	client_id = session["warden.user.client.key"][0][0]
  	client = Client.find(client_id)
  	loc = client.locations.new(get_locations_params)
  	if loc.save
  		flash[:notice] = "Your new location has been recorded"
  	else
  		flash[:alert] = "There was a problem with your new location"
  	end

  	redirect_to locations_new_path
  end

  private
  	def get_locations_params
  		params.require(:locations).permit(:lattitude, :longitude, :hemi_n_s, :hemi_e_w)
  	end
end
