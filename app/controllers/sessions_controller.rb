class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    def new
        @user = User.new
    end
    
    def create
        if @user = User.find_by(email: session_params[:email])
            set_user
            if admin?
                redirect_to admin_user_path(@user)
            else
                redirect_to @user
            end
        else
            redirect_to login_path, notice: "Try again. Email or password doese not exist."
        end
      end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    def omniauth
        @user = User.create_from_omniauth(auth)
        if @user.valid?
            set_user
            redirect_to @user
        else
            flash[:message] = @user.errors.full_messages.join(", ")
            redirect_to new_user_path
        end
    end

    private 


    def session_params
        params.require(:email)
    end

    def auth
        request.env['omniauth.auth']
    end

    def session_params
        params.require(:user).permit(:first_name, :last_name, :password, :email)
    end

end
