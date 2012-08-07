class ImagesController < AdminController

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.new
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.find(params[:id])
  end

  def index
    @gallery = Gallery.find(params[:gallery_id])        
  end

  def create
    gallery = Gallery.find(params[:gallery_id])
    image = gallery.images.new(params[:image])
    if image.save
      redirect_to gallery_images_path(gallery)
    else
      flash[:error] = "Image could not be created"
      render :action => "new"
    end
  end

  def update
    image = Image.find(params[:id])
    if image.update_attributes(params[:image])
      redirect_to gallery_images_path(image.gallery)
    else
      flash[:error] = "Image could not be updated"      
      render :action => "edit"
    end
  end

  def destroy
    image = Image.find(params[:id])
    gallery = image.gallery
    image.destroy
    redirect_to gallery_images_path(gallery)
  end
end