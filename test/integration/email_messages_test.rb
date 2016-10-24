require 'test_helper'

class EmailMessagesTest < ActionDispatch::IntegrationTest
   def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:michael)
  end

  test "email messgages" do
    get contact_path
    assert_template 'email_messages/_form'
    # Invalid email
    post email_messages_path, params: {name: "nathan petts", email: "", url: "http://www.google.com", about: Faker::Lorem.paragraph, where: Faker::Lorem.paragraph, date: Faker::Time.forward(23, :evening), nickname: ""  }
    follow_redirect!
    assert_not flash.empty?
    assert_template 'email_messages/_form'

    #Honeypot Go!
    post email_messages_path, params: {name: "nathan petts", email: "foo@bar.com", url: "http://www.google.com", about: Faker::Lorem.paragraph, where: Faker::Lorem.paragraph, date: Faker::Time.forward(23, :evening), nickname: "honeypot"  }
    follow_redirect!
    assert_not flash.empty?
    assert_template 'email_messages/_form'


    # Valid email
    post email_messages_path,
         params: {name: "nathan petts", email: "foo@bar.com", url: "http://www.google.com", about: Faker::Lorem.paragraph, where: Faker::Lorem.paragraph, date: Faker::Time.forward(23, :evening), nickname: ""   }
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_url
  

  end


end
