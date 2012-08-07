class ImageWidget < Widget
  belongs_to :image
  
  field :caption
  field :display_in_lightbox, :default => false, :type => Boolean
  field :width, :type => Integer
  field :height, :type => Integer
  field :link
  
  mount_uploader :file, ImageWidgetUploader
  
end