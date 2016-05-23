require 'test_helper'

class Backoffice::CellControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get populate_bracket" do
    get :populate_bracket
    assert_response :success
  end

end
