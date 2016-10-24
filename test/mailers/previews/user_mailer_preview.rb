# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
  	user = User.first
  	user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.first
    user.reset_token =  User.new_token
    UserMailer.password_reset(user)
  end

  def booking_email
    
    data = {name: "Bob Booker", email: "bob@bob.com", url: "http://www.bob.com", about: Faker::Lorem.paragraph, where: Faker::Lorem.paragraph}
    UserMailer.booking_email(data)
  end
end
