class StaticPagesController < ApplicationController
  def home
    @shows_upcoming = Show.where("date >= ?", Time.zone.now.beginning_of_day).limit(3)
  end

  def help

  end

  def about
  	
  end

  def contact
  	
  end
end
