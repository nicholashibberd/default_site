class BackgroundImageUploader < ImageUploader
  process :resize_to_fill => [1160, 300]
end