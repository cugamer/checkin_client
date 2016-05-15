class LocationsController < ApplicationController
  def new
  end

  def index
   	@locations = getAllLocationsByCompanyId(current_client[:id])
  end

  def create
    new_loc = get_locations_params
    address = "#{new_loc[:street_addy]} #{new_loc[:city]} #{new_loc[:state]} #{new_loc[:zip_code]}"
    gps_coords = getGPSCoords(address)

    if gps_coords
      submitted_loc = addLocation({
        :location_title => new_loc[:location_title],
        :lattitude => gps_coords[0],
        :longitude => gps_coords[1],
        :street_address => new_loc[:street_addy],
        :city => new_loc[:city],
        :state => new_loc[:state],
        :postal_code => new_loc[:zip_code],
        :hemi_n_s => "n",
        :hemi_e_w => "w"
      })
      if submitted_loc.key?("errors")
    		flash[:alert] = "There was a problem with your new location"
        @errors = submitted_loc["errors"]
        render locations_new_path
      else
        flash[:notice] = "Your new location has been recorded"
        redirect_to locations_new_path
      end
    else
      flash[:alert] = "Address entered not found"
      render locations_new_path
    end
  end

  def destroy
    deleteLocation(params[:id])
    redirect_to locations_index_path
  end

  def edit
    gps_coords = getSpecificLocation(params[:id])
    p gps_coords
    p "----------------------------------------"
    @location = gps_coords
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
  		params.require(:locations).permit(:location_title, :street_addy, :city, :state, :zip_code)
  	end
end
