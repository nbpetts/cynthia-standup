class MessagesController < ApplicationController

  def create
    @message = Show.create(show_params)
    if @show.save
      flash[:success] = "Show posted."
      redirect_to shows_url
    else
      render 'new'
    end
  end
end