class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :user_has_profile?

    helper_method :current_user
    
    def current_user
     
      current_user ||=  User.find(session[:user_id]) if session[:user_id]
    end

    private

    def authenticate_user!
      redirect_to login_path, notice: "no estas logiado" unless current_user
    end

    def user_has_profile?
      if current_user && current_user.profile.nil?
        redirect_to new_profile_path, notice: 'tell us about you'
      end
    end

    def user_is_member?
      if current_user && current_user.profile.member?
        redirect_to root_path, notice: "You don't have permissions."
      end
    end
end
