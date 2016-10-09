require 'test_helper'

class ShowTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @show = shows(:one)
  end

  test "should be vaild" do
    assert @show.valid?
  end

  test "venue should be present" do
    @show.venue = "   "
    assert_not @show.valid?
  end

  test "date should not be nil" do
    assert_not @show.date = nil
  end

  test "date should be dateTime" do
    @show.date = "   "
    assert_not @show.valid?
  end



  test "order should be newest first" do
    assert_equal shows(:most_recent), Show.first
  end


end
