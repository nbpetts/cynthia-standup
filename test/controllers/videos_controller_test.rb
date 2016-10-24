require 'test_helper'

class VideosControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @user = users(:michael)
    @video = videos(:one)
    @other_user = users(:archer)
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

  test "should video video" do
    get video_url(@video)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_video_path(@video)
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

  test "should redirect create when not logged in" do
    assert_no_difference 'Video.count' do
      post videos_path, @params

    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Video.count' do
      delete video_path(@video)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    assert_no_difference 'Video.count' do
      delete video_path(@video)
    end
    assert_redirected_to root_url
  end

  test "should redirect edit when not logged in" do
    get edit_video_path(@video)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do 
    patch video_path(@video), @params
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should not allow the video to be edited via the web" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch video_path(@video), @params
    assert_not @other_user.reload.admin?
  end
end
