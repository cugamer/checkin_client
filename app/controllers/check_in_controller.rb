class CheckInController < ApplicationController
  def new
    @checkIn = ""
  end


  def create
    redirect_to action: 'new'
  end

  private
  	def check_in_params
  		params.require(:new).permit(:lattitude)

  	end
end
