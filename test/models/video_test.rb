require 'test_helper'

class VideoTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @video = videos(:one)
    @other_video = videos(:two)
  end

  test "should be vaild" do
    assert @video.valid?
  end

  test "Title should be present" do
    @video.title = "   "
    assert_not @video.valid?
  end

  test "url should not be nil" do
    assert_not @video.url = nil
  end

  test "url should be presemnt" do
    @video.url = "   "
    assert_not @video.valid?
  end



  test "updating front page should make all others front_page = false" do
    #log_in_as(@user)
    assert @video.front_page == true
    @other_video.update(front_page: true)
    @video.reload
    assert @video.front_page == false
  end
end
