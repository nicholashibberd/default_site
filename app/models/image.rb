class Image
  include Mongoid::Document
  
  field :name
  field :gallery, :default => 'content'
  field :width
  field :height
  field :gallery
  
  GALLERIES = {
    'content' => {:name => 'content', :type => 'collection'},
    'background' => {:name => 'background', :width => 1160, :height => 300, :type => 'collection'},    
    'slideshow' => {:name => 'slideshow', :width => 600, :height => 200, :type => 'gallery'}
  }
  
  scope :by_gallery, lambda {|gallery| where(:gallery => gallery)}
  
  #validates_presence_of :name
  #validates_uniqueness_of :name
  
  mount_uploader :file, ImageUploader
  
  def gallery_type
    gallery = self.class::GALLERIES[gallery]
    gallery['type']
  end
  
end
