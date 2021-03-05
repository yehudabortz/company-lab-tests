class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
   helper_method :current_user, :logged_in?, :current_company

   
   private
   
   def set_company
     session[:company_id] = @company.id 
   end

   def set_user
     session[:user_id] = @user.id 
   end

   def current_company
      Company.find_by(id: session[:company_id])
   end

   def current_user
      User.find_by(id: session[:user_id])
   end

   def logged_in?
      !current_user.nil?
   end

   def require_login
      return redirect_to login_path unless logged_in?
   end
end
