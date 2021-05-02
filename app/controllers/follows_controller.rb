class FollowsController < ApplicationController
    before_action :set_user
  
    def follow_user
      if current_user.follow @user.id
        redirect_to @user
        end
    end
  
    def unfollow_user
        if current_user.unfollow @user.id
            redirect_to @user
        end
    end
  
    def followers
      @followers = @user.followers
    end
  
    def followees
      @followees = @user.followees
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
end