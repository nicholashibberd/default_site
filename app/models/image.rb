class Image
  include Mongoid::Document
  default_scope asc(:position)
  
  field :name
  field :position
  field :width, :type => Integer
  field :height, :type => Integer
  field :thumbnail_width, :type => Integer
  field :thumbnail_height, :type => Integer
  field :gallery

  GALLERIES = {
    :content => {:name => 'Content', :slug => 'content', :gallery => false, :variable => true},
    :background => {:name => 'Background', :slug => 'background', :width => 1160, :height => 300, :gallery => false, :variable => false},
    :slideshow => {:name => 'Slideshow', :slug => 'slideshow', :thumbnail_width => 140, :thumbnail_height => 100, :gallery => true, :variable => true}
  }

  scope :by_gallery, lambda {|gallery| where(:gallery => gallery)}
  
  mount_uploader :file, ImageUploader
  before_create :set_position
  
  def set_position
    self.position = Image.max_position + 1
  end

  def self.max_position
    existing_images = self.all.select {|image| !image.position.nil?}
    current_highest = existing_images.map(&:position).max
    current_highest ||= 0
  end  

  def self.from_gallery(gallery)
    gallery ? by_gallery(gallery) : all
  end

end
