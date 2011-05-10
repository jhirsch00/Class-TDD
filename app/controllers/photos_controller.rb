class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.build(params[:photo])
    
    
    if @photo.save
      flash[:notice] = "Photo uploaded successfully"
      redirect_to(gallery_path(@photo.gallery))
    end
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end

end
