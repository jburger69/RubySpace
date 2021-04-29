class PostsController < ApplicationController

    def index
        @user = User.all
        @posts = Post.all
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comment = Comment.new

    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to posts_path
        else
            render new_post_path
        end
    end

    def edit
        @post = current_user.posts.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            @error = @post.errors.full_messages
            render :edit
        end
    end

    def destroy
        @post = current_user.posts.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:content, :image_url, :views, :image)
    end
end
