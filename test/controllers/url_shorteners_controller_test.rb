require 'test_helper'

class UrlShortenersControllerTest < ActionController::TestCase
  setup do
    @url_shortener = url_shorteners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:url_shorteners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create url_shortener" do
    assert_difference('UrlShortener.count') do
      post :create, url_shortener: { original_url: @url_shortener.original_url, shortened_url: @url_shortener.shortened_url, user_id: @url_shortener.user_id }
    end

    assert_redirected_to url_shortener_path(assigns(:url_shortener))
  end

  test "should show url_shortener" do
    get :show, id: @url_shortener
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @url_shortener
    assert_response :success
  end

  test "should update url_shortener" do
    patch :update, id: @url_shortener, url_shortener: { original_url: @url_shortener.original_url, shortened_url: @url_shortener.shortened_url, user_id: @url_shortener.user_id }
    assert_redirected_to url_shortener_path(assigns(:url_shortener))
  end

  test "should destroy url_shortener" do
    assert_difference('UrlShortener.count', -1) do
      delete :destroy, id: @url_shortener
    end

    assert_redirected_to url_shorteners_path
  end
end
