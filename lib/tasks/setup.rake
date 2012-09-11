namespace :setup do
	desc "Create Homepage"
  task :create_homepage => :environment do
  	Page.create(:name => "Home", :slug => 'home')
  end

  desc "Create Admin User"
  task :create_user => :environment do
    User.create(:name => 'Admin', :email => 'admin@default_site.com', :password => 'password', :password_confirmation => 'password')
  end

  desc "all"
  task :all => [:environment, :create_homepage, :create_user]
end