class Gallery < ImageCollection
  include Mongoid::Document
  
  field :image_type
  field :variable
  field :gallery_type
  field :thumb_width
  field :thumb_height

  def new_image(params = {})
  	GalleryImage.new(params)
  end

end
