class CommentsController < ApplicationController

    def new
        
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        if @comment.valid?
            @comment.save
            flash[:message] = "Comment successful"
            redirect_to post_path(@post)
        else
            render :new
            flash[:message] = "Sorry that didnt work"
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
