require 'test_helper'

class WritingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @writing = writings(:one)
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should get index" do
    get writings_url
    assert_response :success
  end

  test "should get new" do
    get new_writing_url
    assert_response :success
  end

  test "should create writing" do
    log_in_as(@user)
    assert_difference('Writing.count') do
      post writings_url, params: { writing: { body: @writing.body, title: @writing.title } }
    end

    assert_redirected_to writing_url(Writing.last)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Writing.count' do
      post writings_path, params: { writing: { body: @writing.body, title: @writing.title } }

    end
    assert_redirected_to login_url
  end

  test "should show writing" do
    get writing_url(@writing)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_writing_url(@writing)
    assert_response :success
  end

  test "should update writing" do
    log_in_as(@user)
    patch writing_url(@writing), params: { writing: { body: @writing.body, title: @writing.title } }
    assert_redirected_to writing_url(@writing)
  end

  test "should destroy writing" do
    log_in_as(@user)
    assert_difference('Writing.count', -1) do
      delete writing_url(@writing)
    end

    assert_redirected_to writings_url
  end
end
