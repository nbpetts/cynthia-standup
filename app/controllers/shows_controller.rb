class ShowsController < ApplicationController
  
  def create
    @show - Show.new(show_params)
    if @show.save
      # fill this in
    else
      render 'new'
    end
  end

  def show 
    
  end

  def index
    @shows = Show.all
  end


  private
    def show_params
      params.require(:venue, :date).permit(:venue, 
                                           :date, 
                                           :show_type, 
                                           :url)
    end
end
