class CheckInController < ApplicationController
  def checkInPage
    
  end


  def regCheckin
  end

  private
  	def check_in_params
  		params.require().permit()

  	end
end
