module ImagesHelper
  def image_form_path(collection, image)
    image.new_record? ? image_collection_images_path(collection) : image_collection_image_path(collection, image)
  end

  def galleries_select
  	Gallery.galleries.map {|gal| [gal[:name].titleize, gal[:name]]}
  end
end