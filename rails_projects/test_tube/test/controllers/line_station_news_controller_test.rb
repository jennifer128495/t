require 'test_helper'

class LineStationNewsControllerTest < ActionController::TestCase
  setup do
    @line_station_news = line_station_news(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_station_news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_station_news" do
    assert_difference('LineStationNew.count') do
      post :create, line_station_news: { line_id: @line_station_news.line_id, station_id: @line_station_news.station_id }
    end

    assert_redirected_to line_station_news_path(assigns(:line_station_news))
  end

  test "should show line_station_news" do
    get :show, id: @line_station_news
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_station_news
    assert_response :success
  end

  test "should update line_station_news" do
    patch :update, id: @line_station_news, line_station_news: { line_id: @line_station_news.line_id, station_id: @line_station_news.station_id }
    assert_redirected_to line_station_news_path(assigns(:line_station_news))
  end

  test "should destroy line_station_news" do
    assert_difference('LineStationNew.count', -1) do
      delete :destroy, id: @line_station_news
    end

    assert_redirected_to line_station_news_path
  end
end
