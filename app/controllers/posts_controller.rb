class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.each_with_index{|ele,i|
      ele.title = "Spam" if i % 5 == 0
    }
  end

  def show
  end

  def new
  end

  def edit
  end
end
