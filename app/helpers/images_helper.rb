module ImagesHelper
  def image_form_path(gallery, image)
    image.new_record? ? gallery_images_path(gallery) : gallery_image_path(gallery, image)
  end
end