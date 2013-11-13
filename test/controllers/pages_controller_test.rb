require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  def test_landing
    get :landing
    assert_response :success
    assert_template 'landing'
  end
  
end
