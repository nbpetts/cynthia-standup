require 'test_helper'

class ShowInterfaceTest < ActionDispatch::IntegrationTest
   def setup
    @user = users(:michael)
    @params = {params: {show: {venue: "lorem ipsum", date: DateTime.now(), show_type: "Standup", url: "http://www.google.com"}}}
    @show = shows(:one)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.shows'
    # Invalid submission
    assert_no_difference 'Show.count' do
      post shows_path, params: { show: { venue: "" } }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    assert_difference 'Show.count', 1 do
      post shows_path, @params
    end
    assert_redirected_to shows_url
    follow_redirect!
    assert_match @params[:params][:show][:venue], response.body
    # Delete post
    assert_select 'a', text: 'delete'
   
    assert_difference 'Show.count', -1 do
      delete show_path(@show)
    end
   
  end
end
