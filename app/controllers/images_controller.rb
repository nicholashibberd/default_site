class ImagesController < AdminController
  before_filter :set_gallery

  def new
    @image = Image.new
  end

  def edit
    @image = Image.find(params[:id])
  end

  def index
    @images = Image.by_gallery(@gallery)
  end

  def create
    image = Image.new(params[:image])
    if image.save
      redirect_to gallery_images_path(@gallery)
    else
      flash[:error] = "Image could not be created"
      render :action => "new"
    end
  end

  def update
    image = Image.find(params[:id])
    if image.update_attributes(params[:image])
      redirect_to gallery_images_path(@gallery)
    else
      flash[:error] = "Image could not be updated"      
      render :action => "edit"
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    redirect_to gallery_images_path(@gallery)
  end

  def set_gallery
    @gallery = params[:gallery_id] 
    @gallery_info = Image::GALLERIES[@gallery]
  end
end