class Image
  include Mongoid::Document
  default_scope asc(:position)
  
  field :name
  field :position
  
  mount_uploader :file, ImageUploader
  belongs_to :image_collection
  
  def self.new_instance(collection, params)
    collection.variable ? ContentImage.new(params[:content_image]) : GalleryImage.new(params[:gallery_image])
  end

  before_create :set_position
  
  def set_position
    self.position = Image.max_position + 1
  end

  def self.max_position
    existing_images = self.all.select {|image| !image.position.nil?}
    current_highest = existing_images.map(&:position).max
    current_highest ||= 0
  end  

end
