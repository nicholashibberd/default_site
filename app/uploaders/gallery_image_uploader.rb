class GalleryImageUploader < ImageUploader
	process :resize
	version :gallery_thumb do
		process :resize_thumb
	end

	def resize
    resize_to_fit *(model.dimesions)
  end

  def resize_thumb
    resize_to_fit *(model.thumb_dimesions)
  end
end