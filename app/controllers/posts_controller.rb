class PostsController < ApplicationController
    
before_action :authenticate_user!, only: [:new,:create]

def index
    @post = Post.all
end

def new
    @post = Post.new
end
def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Object successfully created"
      redirect_to @post
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
end





def post_params
    params.require(:post).permit(:title, :content)
end


end
