class ImageCollection
	include Mongoid::Document

	field :name
  field :slug
  field :width
  field :height
  field :variable

  has_many :images
  validates_uniqueness_of :name, :slug
  before_create :generate_slug

  def to_param
    slug
  end

  def self.find_by_slug(slug)
    self.where(:slug => slug).first
  end  

  def generate_slug
    self.slug = name.gsub("'", "").parameterize('_')
  end

  def self.new_instance(collection)
    collection == 'collection' ? ImageCollection.new : Gallery.new
  end

  def order_images(params)
    images.each do |image|
      image.position = params['image'].index(image.id.to_s) + 1
      image.save!
    end
  end

end