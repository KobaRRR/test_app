class ApplicationController < ActionController::Base

    def authenticate_user
        if session[:user_id]
          @current_user = User.find_by(user_id: session[:user_id])
        else
          flash[:notice] = "please log in"
          redirect_to '/'
        end
        # if session[:user_id]
        #   @current_user = User.find_by(id: session[:user_id])
        # end
        # if session[:user_id].nil? # or blank?
        #   flash[:notice] = "please log in"
        #   redirect_to '/'
        # end 
      end
end
