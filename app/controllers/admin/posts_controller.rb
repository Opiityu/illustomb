class Admin::PostsController < ApplicationController
  # This is a before_action that checks if the current user is an admin before executing any action in this controller.


  # This is a before_action that sets the @post instance variable for specific actions.


  # This action is responsible for displaying a list of all posts.
  def index
    @posts = Post.all
  end

  # Add more actions here as needed for your application, like 'new', 'create', 'edit', 'update', etc.

  # This is a private method used as a before_action to check if the current user is an admin.
  private


  # This is a private method used as a before_action to set the @post instance variable.

end
