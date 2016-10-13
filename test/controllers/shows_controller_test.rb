require 'test_helper'

class ShowsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
    @show = shows(:one)
    @params = {params: {show: {venue: "lorem ipsum", date: DateTime.now(), show_type: "Standup", url: "http://www.google.com"}}}
  end


  test "should redirect create when not logged in" do
    assert_no_difference 'Show.count' do
      post shows_path, @params

    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Show.count' do
      delete show_path(@show)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    assert_no_difference 'Show.count' do
      delete show_path(@show)
    end
    assert_redirected_to root_url
  end

  test "should redirect edit when not logged in" do
    get edit_show_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do 
    patch show_path(@show), @params
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should not allow the show to be edited via the web" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch show_path(@show), @params
    assert_not @other_user.reload.admin?
  end

end
