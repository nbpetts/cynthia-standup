class ShowsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit, :update]
  
  before_action :admin_user, only: [:create, :destroy, :edit, :update]

  def index
    @shows = Show.all
    @shows_upcoming = Show.where("date >= ?", Time.zone.now.beginning_of_day)
    @shows_past = Show.where("date <= ?", Time.zone.now.beginning_of_day)
  end


  def new 
    @show = Show.new
  end

  def create
    @show = Show.create(show_params)
    if @show.save
      flash[:success] = "Show date posted."
      redirect_to shows_url
    else
      render 'new'
    end
  end

  def edit 
    @show = Show.find(params[:id])
  end

  def update 
    @show = Show.find(params[:id])
    if @show.update_attributes(show_params)
      flash[:success] = "Show updated"
      redirect_to shows_url
      
    else
      render 'edit'
    end
  end

  def destroy
    Show.find(params[:id]).destroy
    flash[:success] = "Show deleted"
    redirect_to request.referrer || root_url
  end


  private
    def show_params
      
      params.require(:show).permit(:venue,
                                   :date,
                                   :show_type, 
                                   :url)
    end

    
end
