class GalleryImageUploader < ImageUploader
  process :resize_to_fit => [900, 900]
  
  version :gallery_thumb do
    process :resize_to_fit => [500, 140]
  end
  
end