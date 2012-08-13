class GalleriesController < AdminController

  def order_images
    gallery = Gallery.find(params[:id])
    gallery.order_nav_items(params)
    render :nothing => true
  end  
end