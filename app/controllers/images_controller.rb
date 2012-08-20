class ImagesController < AdminController
  before_filter :set_collection

  def new
    @image = @collection.images.new
  end

  def edit
    @image = Image.find(params[:id])
  end

  def index
    @images = @collection.images
  end

  def create
    image = @collection.images.new(params[:image])
    if image.save
      redirect_to image_collection_images_path(@collection)
    else
      flash[:error] = "Image could not be created"
      render :action => "new"
    end
  end

  def update
    image = Image.find(params[:id])
    if image.update_attributes(params[:image])
      redirect_to image_collection_images_path(@collection)
    else
      flash[:error] = "Image could not be updated"      
      render :action => "edit"
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    redirect_to image_collection_images_path(@collection)
  end

  def set_collection
    @collection = ImageCollection.find_by_slug(params[:image_collection_id])
  end

  def order_images
    collection = ImageCollection.find(params[:collection])
    collection.order_images(params)
    render :nothing => true
  end  
end