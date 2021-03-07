class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
   include TestsHelper
   helper_method :current_user, :logged_in?, :current_company, :admin?

   private

   def set_user
     session[:user_id] = @user.id 
   end

   def find_user
    @user = User.find_by(id: params[:id])
   end

   def current_lab
    current_user.lab
   end

   def current_company
    current_user.company
   end

   def current_user
      User.find_by(id: session[:user_id])
   end

   def logged_in?
      !current_user.nil?
   end

   def require_login
      return redirect_to login_path, notice: "Login Required" unless logged_in?
   end

   def admin?
      if !current_user.nil?
         current_user.super_admin || current_user.belongs_to_lab || current_user.belongs_to_company
      end
   end

   def params_id_integer
      params[:id].to_i
   end

end

