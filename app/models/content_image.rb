class ContentImage < Image
  field :width, :type => Integer
  field :height, :type => Integer

  belongs_to :image_collection

  has_many :image_widgets
	mount_uploader :file, ContentImageUploader

end