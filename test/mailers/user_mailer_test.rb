require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  test "account_activation" do
    user = users(:michael)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Account Activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.name,               mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI.escape(user.email),  mail.body.encoded
  end

  test "password_reset" do
    user = users(:michael)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "Password reset", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.reset_token,        mail.body.encoded
    assert_match CGI.escape(user.email),  mail.body.encoded
  end

  test "booking_email" do
 
    data = {name: "Bob Booker", email: "bob@bob.com", url: "http://www.bob.com", about: Faker::Lorem.paragraph, where: Faker::Lorem.paragraph}
    mail = UserMailer.booking_email(data)

    assert_equal "Someone wants to book you", mail.subject
    assert_equal ["nbpetts@gmail.com"], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match data[:email],        mail.body.encoded
    assert_match data[:name],        mail.body.encoded
    assert_match data[:url],        mail.body.encoded
   


  end

end
