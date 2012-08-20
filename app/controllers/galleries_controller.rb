class GalleriesController < AdminController

	def new
		@gallery = Gallery.new
	end
	
	def edit
		@gallery = Gallery.find_by_slug(params[:gallery_id])
	end

	def index
		@galleries = Gallery.all
	end

  def order_images
    gallery = Gallery.find(params[:id])
    gallery.order_nav_items(params)
    render :nothing => true
  end  
end