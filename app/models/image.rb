class Image
  include Mongoid::Document
  
  field :name
  field :gallery, :default => 'content'
  field :width
  field :height
  field :gallery
  
  GALLERIES = {
    'content' => {:name => 'content', :type => 'collection', :variable => true},
    'background' => {:name => 'background', :width => 1160, :height => 300, :type => 'collection', :variable => false},
    'slideshow' => {:name => 'slideshow', :width => 600, :height => 200, :type => 'gallery', :variable => false}
  }
  
  scope :by_gallery, lambda {|gallery| where(:gallery => gallery)}
  
  #validates_presence_of :name
  #validates_uniqueness_of :name
  
  mount_uploader :file, ImageUploader
  
  def gallery_type
    gal = self.class::GALLERIES[gallery]
    gal[:type]
  end
  
end
