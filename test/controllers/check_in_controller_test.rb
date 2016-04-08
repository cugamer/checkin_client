require 'test_helper'

class CheckInControllerTest < ActionController::TestCase
  test "should get regCheckin" do
    get :regCheckin
    assert_response :success
  end

end
