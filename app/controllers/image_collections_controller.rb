class ImageCollectionsController < AdminController

	def new
		@collection = ImageCollection.new_instance(params[:collection])
	end
	
	def edit
		@collection = ImageCollection.find_by_slug(params[:gallery_id])
	end

	def index
		@collections = ImageCollection.all
	end

  def order_images
    collection = ImageCollection.find(params[:id])
    collection.order_nav_items(params)
    render :nothing => true
  end  
end