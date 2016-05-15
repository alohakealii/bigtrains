#!/bin/bash

rails new bigtrains
cd bigtrains
bin/rails g scaffold User first_name:string last_name:string phone:string email:string primary_group:references
bin/rails g scaffold Group name:string 
bin/rails g scaffold Topic title:text group:references
bin/rails g scaffold Post body:text topic:references user:references author_first_name:string author_last_name:string author_role:string
bin/rails g model Group_membership group:references user:references role:string access:string
bin/rails g model Group_hierarchy parent:references child:references
bin/rake db:migrate

# copy Gemfile
# bundle install
# copy app folder

# NOTE: some attributes were added as migrations, may not work exactly right using this script (e.g. primary_group)
