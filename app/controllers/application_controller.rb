class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def welcome
        
    end

    def search
        if params[:search].blank?  
            redirect_to(posts_path, alert: "Empty field!") and return  
        else  
            @parameter = params[:search].downcase  
            @results = Post.all.where("lower(content) LIKE :search", search: @parameter)
        end 
    end


    protected

    def configure_permitted_parameters
        attributes = [:name]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end

    def after_sign_in_path_for(resource)
        posts_path(current_user) # your path
    end
end
