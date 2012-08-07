class Image
  include Mongoid::Document
  
  field :name
  
  belongs_to :gallery
  #validates_presence_of :name
  #validates_uniqueness_of :name
  
  def width
    gallery.width
  end
  
  def height
    gallery.height
  end
  
  def thumbnail_width
    gallery.thumbnail_width
  end
  
  def thumbnail_height
    gallery.thumbnail_height
  end
  
  mount_uploader :file, GalleryImageUploader
  
end
