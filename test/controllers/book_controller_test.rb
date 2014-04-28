require 'test_helper'

class BookControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

  test "should get logueur" do
    get :logueur
    assert_response :success
  end

end
