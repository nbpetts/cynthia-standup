require 'test_helper'

class VideosControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @user = users(:michael)
    @video = videos(:one)
  end

  test "should get index" do
    get videos_url
    assert_response :success
  end

  test "should get new" do
    get new_video_url
    assert_response :success
  end

  test "should create video" do
    log_in_as(@user)
    assert_difference('Video.count') do
      post videos_url, params: { video: { title: @video.title, url: @video.url } }
    end

    assert_redirected_to videos_url
  end

  test "should show video" do
    get video_url(@video)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_video_url(@video)
    assert_response :success
  end

  test "should update video" do
    log_in_as(@user)
    patch video_url(@video), params: { video: { title: @video.title, url: @video.url } }
    assert_redirected_to videos_url
  end

  test "should destroy video" do
    log_in_as(@user)
    assert_difference('Video.count', -1) do
      delete video_url(@video)
    end

    assert_redirected_to videos_path
  end
end
