class CommentsController < ApplicationController

    def new
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new
        
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        if @comment.valid?
            @comment.save
            redirect_to post_path(@post)
        else
            render :new
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :post_id, :author_id)
    end
end
