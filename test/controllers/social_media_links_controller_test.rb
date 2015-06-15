require 'test_helper'

class SocialMediaLinksControllerTest < ActionController::TestCase
  setup do
    @social_media_link = social_media_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:social_media_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create social_media_link" do
    assert_difference('SocialMediaLink.count') do
      post :create, social_media_link: { name: @social_media_link.name, url: @social_media_link.url }
    end

    assert_redirected_to social_media_link_path(assigns(:social_media_link))
  end

  test "should show social_media_link" do
    get :show, id: @social_media_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @social_media_link
    assert_response :success
  end

  test "should update social_media_link" do
    patch :update, id: @social_media_link, social_media_link: { name: @social_media_link.name, url: @social_media_link.url }
    assert_redirected_to social_media_link_path(assigns(:social_media_link))
  end

  test "should destroy social_media_link" do
    assert_difference('SocialMediaLink.count', -1) do
      delete :destroy, id: @social_media_link
    end

    assert_redirected_to social_media_links_path
  end
end
