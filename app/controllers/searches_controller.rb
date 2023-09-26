class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @posts = Post.forward_match(params[:word])
  end
end
