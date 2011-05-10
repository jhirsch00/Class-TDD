class GalleriesController < ApplicationController
  
  before_filter :authorize, :except => [:index, :show]

  def index
    if signed_in?
      @galleries = current_user.galleries
    else
      @galleries = Gallery.all
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
    # @gallery = current_user.galleries.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Gallery not found"
    redirect_to :action => 'index'
  end
  
  def new
    @gallery = Gallery.new
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def create
    @gallery = current_user.galleries.build(params[:gallery])

    if @gallery.save
      redirect_to(@gallery, :notice => 'Gallery created successfully')
    else
      render :action => "new"
    end
  end

  def update
    @gallery = Gallery.find(params[:id])

    if @gallery.update_attributes(params[:gallery])
      redirect_to(@gallery, :notice => 'Gallery was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to(galleries_url)
  end
end
