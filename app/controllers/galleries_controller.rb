class GalleriesController < AdminController

  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def create
    gallery = Gallery.new(params[:gallery])
  
    if gallery.save
  		redirect_to galleries_path, :notice => "Successfully created gallery"
    else
      flash[:error] = "Gallery could not be created"
      render :action => "new"
    end
  end

  def update
    @gallery = Gallery.find(params[:id])

    if @gallery.update_attributes(params[:gallery])
  		redirect_to galleries_path, :notice => "Successfully update gallery"
    else
      flash[:error] = "Gallery could not be updated"
      render :action => "edit"
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    redirect_to galleries_path
  end
  
  def order_images
    gallery = Gallery.find(params[:id])
    gallery.order_nav_items(params)
    render :nothing => true
  end  


end