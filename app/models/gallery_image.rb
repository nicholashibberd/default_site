class GalleryImage < Image
	field :caption

	belongs_to :gallery
	mount_uploader :file, GalleryImageUploader

	def dimensions
		[gallery.width, gallery.height]
	end

	def thumb_dimensions
		[gallery.thumb_width, gallery.thumb_height]
	end

end