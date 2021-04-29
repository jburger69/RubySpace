class CommentsController < ApplicationController

    def create
        @post = current_user.posts.find_by_id(params[:post_id])
        @comment = @post.comments.build(comment_params)
        if @comment.save
            flash[:message] = "Comment successful"
            redirect_to post_path(@post)
        else
            flash[:message] = "Sorry that didnt work"
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :post_id, :author_id)
    end
end
