class GalleryWidget < Widget
	field :gallery_id

	def gallery
		ImageCollection.find_by_slug(gallery_id) 	
	end  
end