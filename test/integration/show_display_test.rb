require 'test_helper'

class ShowDisplayTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  

  test "Home page display" do
    get root_path
    assert_template 'shows/_show'
    assert_match shows.count.to_s, response.body
  end

  test "show shows on page" do
    get shows_path
    assert_template 'shows/index'
  end
end
