class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index   # Displays 'place' records (10 per page) on 'root' page(s)
    @places = Place.order("created_at ASC").page(params[:page]).per(10)
  end

  def new   # Creates a new database record based on data the visitor submitted
    @place = Place.new
  end

  def create   
    @place = current_user.places.create(place_params) # Sends visitor's form submission to the database.
    
    if @place.valid?
      redirect_to root_path  # Redirects visitor to Home page after submitting form.  
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render text: 'You are Not Allowed to Edit this Page', status: :forbidden
    end
  end

  def update
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render text: 'You are Not Allowed to Edit this Page', status: :forbidden
    end

    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render text: 'You are Not Allowed to Delete this Place', status: :forbidden
    end

    @place.destroy
    redirect_to root_path
  end

  private

  def place_params   # Pulls submitted name, description and address values from the form.
    params.require(:place).permit(:name, :description, :address)
  end

end