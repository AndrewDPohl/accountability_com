require 'rails_helper'

RSpec.describe SitesController, :type => :controller do
  it "renders the index template" do
    get :index
    expect(response).to render_template("index")    
  end

  it "renders the about template" do
    get :about
    expect(response).to render_template("about")
  end


end
