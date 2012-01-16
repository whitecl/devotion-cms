bundle install
read -p "Drop Db? [y/N]" DROP_DB
if [ "$DROP_DB" == "y" ] 
then
	rake db:drop
	rake db:create
fi
rake db:migrate
if [ "$DROP_DB" == "y" ] 
then
	echo "run the following command (or some variation thereof) in the console to set up your first user"
	echo "AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')"
	bundle exec rails console
fi
bundle exec rails server
