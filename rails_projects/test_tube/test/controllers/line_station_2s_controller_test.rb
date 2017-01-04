require 'test_helper'

class LineStation2sControllerTest < ActionController::TestCase
  setup do
    @line_station_2 = line_station_2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_station_2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_station_2" do
    assert_difference('LineStation2.count') do
      post :create, line_station_2: { line_id: @line_station_2.line_id, station_id: @line_station_2.station_id }
    end

    assert_redirected_to line_station_2_path(assigns(:line_station_2))
  end

  test "should show line_station_2" do
    get :show, id: @line_station_2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_station_2
    assert_response :success
  end

  test "should update line_station_2" do
    patch :update, id: @line_station_2, line_station_2: { line_id: @line_station_2.line_id, station_id: @line_station_2.station_id }
    assert_redirected_to line_station_2_path(assigns(:line_station_2))
  end

  test "should destroy line_station_2" do
    assert_difference('LineStation2.count', -1) do
      delete :destroy, id: @line_station_2
    end

    assert_redirected_to line_station_2s_path
  end
end
