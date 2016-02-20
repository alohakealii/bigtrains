#!/bin/bash

rails new bigtrains
cd bigtrains
bin/rails g scaffold User name:string
bin/rails g scaffold Topic title:text user:references
bin/rails g scaffold Post body:text topic:references user:references
bin/rake db:migrate

# Manual changes to routes.rb, models/topic.rb, views/topics/index.html.erb,
# views/topics/show.html.erb, views/posts/index.html.erb,
# views/posts/show.html.erb, views/layouts/application.html.erb

## To set homepage: in bigtrains/config/routes.rb
## uncomment line 9 and change "welcome" to "topics"
## so line 9 will be: root 'topics#index'
##
## In bigtrains/app/models/topic.rb add "has_many :posts"
##
## In bigtrains/app/views/topics/index.html.erb and
## show.html.erb anywhere it says "topic.user"
## add ".name" so it will be "topic.user.name"
##
## In bigtrains/app/views/posts/index.html.erb and
## show.html.erb do the same thing for post.user
## and add .title to post.topic
##
## To get the topics to display their respective posts, add
## this code to bigtrains/app/views/topics/show.html.erb:
##<p>
##  <strong>Topic ID:</strong>
##  <%= @topic.id %>
##</p>
##
## <div id="posts">
##   <p><strong>Posts:</strong></p>
##   <% @topic.posts.each do |post| %>
##     <div class="post">
##       <p class="post-author"><%= post.user.name %> says:</p>
##       <p class="post-body"><%= post.body %></p>
##     </div>
##   <% end %>
##   <%= link_to 'New Post', new_post_path %>
## </div>
##
## In views/layouts/application.html.erb
## between body and yield, add:
## <nav><%= link_to "Home", root_path %></nav>
## <%= link_to "Show accounts", users_path %><br>

# When creating topics and posts, use the IDs for users and topics
