#!/bin/bash

rails new bigtrains
cd bigtrains
bin/rails g scaffold User name:string
bin/rails g scaffold Topic title:text user:references
bin/rails g scaffold Post body:text topic:references user:references
bin/rake db:migrate

# To set homepage: in bigtrains/config/routes.rb
# uncomment line 9 and change "welcome" to "topics"
# so line 9 will be: root 'topics#index'

# In bigtrains/app/views/topics/index.html.erb and
# bshow.html.erb anywhere it says "topic.user"
# add ".name" so it will be "topic.user.name"

# In bigtrains/app/views/posts/index.html.erb and
# show.html.erb do the same thing for post.user
# and add .title to post.topic

# To create a user go to http://localhost:3000/users

# To create a topic go to http://localhost:3000/
# and in the User field use the id (first user created is 1)

# To create a Post go to http://localhost:3000/posts
# and use ids for Topic and User fields
