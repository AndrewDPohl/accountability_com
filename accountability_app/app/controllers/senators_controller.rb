class SenatorsController < ApplicationController

  def index
    @senators = Senator.all
    render :index
  end

  def show
    @senator = Senator.find(params[:id])
    @votes = @senator.showvotes
    render :show
  end

  def new
  end

  def edit
  end

  def search
    first_name, last_name = params["senator_name"].split(" ")
    @senator = Senator.where("first_name ilike ? and last_name ilike ?", "#{first_name}%", "#{last_name}%").first
    if @senator
      redirect_to @senator
    else
      flash[:error] = "SENATOR NOT FOUND"
      redirect_to senators_path
    end
  end
end
