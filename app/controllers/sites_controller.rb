class SitesController < ApplicationController
  def index
    @senators = Senator.all 
    render :index
  end

  def about
  end

  def contact
  end
end
