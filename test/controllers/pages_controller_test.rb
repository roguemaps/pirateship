require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  def test_landing
    get :landing
    assert_response :success
    assert_template 'landing'
  end
  
  def test_about
    get :about
    assert_response :success
    assert_template 'about'
  
end
