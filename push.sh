git add .
git commit -m "$*"
git subtree push --prefix rottenpotatoes heroku master
heroku open