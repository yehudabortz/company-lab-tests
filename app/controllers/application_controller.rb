class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    


    private
    
    def set_user
      session[:user_id] = @user.id 
   end

end
