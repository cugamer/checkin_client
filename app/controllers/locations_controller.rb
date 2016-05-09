class LocationsController < ApplicationController
  def new
  end

  def index
   	@locations = getAllLocationsByCompanyId(current_client[:id])
  end

  def create
    new_loc = addLocation(get_locations_params)
    if new_loc.key?("errors")
  		flash[:alert] = "There was a problem with your new location"
      @errors = new_loc["errors"]
      render locations_new_path
    else
      flash[:notice] = "Your new location has been recorded"
      redirect_to locations_new_path
    end
  end

  def destroy
    deleteLocation(params[:id])
    redirect_to locations_index_path
  end

  def edit
    @location = getSpecificLocation(params[:id])
  end

  def update
    updated_loc = updateLocation(params[:id], get_locations_params)
    if updated_loc["error"]
      flash[:error] = updated_loc["error"]["reasons"]
      @location = getSpecificLocation(params[:id])
      render :edit
    else
      redirect_to locations_index_path
    end
  end

  private
  	def get_locations_params
  		params.require(:locations).permit(:location_title, :lattitude, :longitude, :hemi_n_s, :hemi_e_w)
  	end
end
