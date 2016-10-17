require 'test_helper'

class VideosInterfaceTest < ActionDispatch::IntegrationTest
   def setup
    @user = users(:michael)
    @params = {params: {video: {title: "lorem ipsum", url: "http://www.google.com"}}}
    @video = videos(:one)
  end

  test "video interface" do
    log_in_as(@user)
    get root_url
    assert_select 'div.videos'
    # Invalid submission
    assert_no_difference 'Video.count' do
      post videos_path, params: { video: { venue: "    " } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    assert_difference 'Video.count', 1 do
      post videos_path, @params
    end
    assert_redirected_to videos_url
    follow_redirect!
    assert_match @params[:params][:video][:title], response.body
    # Delete post
    assert_select 'a', text: 'delete'
   
    assert_difference 'Video.count', -1 do
      delete video_path(@video)
    end
   
  end
end
