class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    def new
    end
    
    def create

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

    def auth
        request.env['omniauth.auth']
    end


end
