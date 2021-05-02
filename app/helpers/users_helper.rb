module UsersHelper
    # Returns if the current user is following the user of passed in "following_id"
    def current_user_is_following(current_user_id, followee_id)
      follow_relationship = Follow.find_by(follower_id: current_user_id, followee_id: followee_id)
      return true if follow_relationship
    end
end