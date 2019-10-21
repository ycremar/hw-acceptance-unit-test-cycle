# rvm use 2.4.0 
# npm i v8 
# npm install -g heroku
# sudo yum install postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs
# bundle install
# heroku login
# heroku create
cd ..
git init
git subtree push --prefix rottenpotatoes heroku master
heroku run rake db:migrate
heroku run rake db:seed
