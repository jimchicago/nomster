class PhotosController < ApplicationController
  def create
    @photo = current_user.photos.create(photo_params) # Sends visitor's form submission to the database.
    if @photo.valid?
      redirect_to root_path  # Redirects visitor to Home page after submitting form.  
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def index
  end
end
