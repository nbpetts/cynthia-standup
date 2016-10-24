class EmailMessagesController < ApplicationController
before_action :valideate_params, only: [:create]
  def create
    @user = User.find_by(email: "nbpetts@gmail.com")

    if @user 
      
      @user.send_booking_email(message_params)
      flash[:success] = "Your message was sent. I'll get back to you as soon as I can!"
      redirect_to root_url
    else
      flash[:danger] = "oops, something went wrong. Try again?"
      redirect_to contact_path

    end
  end

  private
    def message_params
      params.permit(:name, :email, :url, :about, :where, :date, :nickname)
    end

    def valideate_params
      if params[:email].empty? || params[:email].nil?
        flash[:danger] = "You need to include an email. Try again?"
        redirect_to contact_path

      elsif !params[:nickname].empty? 
        flash[:danger] = "oops, something went wrong. Try again?"
        redirect_to contact_path
          
      end


    end
end
