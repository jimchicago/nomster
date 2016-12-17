class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index   # Displays 'place' records (10 per page) on 'root' page(s)
    @places = Place.all.page(params[:page]).per(10)
  end

  def new   # Creates a new database record based on data the visitor submitted
    @place = Place.new
  end

  def create   
    current_user.places.create(place_params)   # Sends visitor's form submission to the database.
    redirect_to root_path     # Redirects visitor to Home page after submitting form.
  end

  private

  def place_params   # Pulls submitted name, description and address values from the form.
    params.require(:place).permit(:name, :description, :address)
  end

end