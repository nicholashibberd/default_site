namespace :setup do
	desc "Create Homepage"
  task :create_homepage => :environment do
  	Page.create(:name => "Home", :slug => 'home')
  end

  desc "Create Admin User"
  task :create_user => :environment do
    User.create(:name => 'Admin', :email => 'admin@default_site.com', :password => 'password', :password_confirmation => 'password')
  end

  desc "Create Image Collections"
  task :create_image_collections => :environment do
  	ImageCollection.create(:name => 'Content', :collection_type => 'collection', :variable => true)
    ImageCollection.create(:name => 'Slideshow', :collection_type => 'gallery', :variable => false, :width => 900, :height => 600, :thumb_width => 200, :thumb_height => 100)
    ImageCollection.create(:name => 'Background', :collection_type => 'collection', :variable => false, :width => 1160, :height => 300)
  end

  desc "all"
  task :all => [:environment, :create_homepage, :create_user, :create_image_collections]
end