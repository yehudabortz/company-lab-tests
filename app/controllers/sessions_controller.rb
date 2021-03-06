class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    def new
        redirect_to user_path(current_user) if logged_in?
        @user = User.new
    end
    
    def create
        if @user = User.find_by(email: session_params[:email])
            if @user && @user.authenticate(session_params[:password])
                set_user
                if admin?
                    redirect_to admin_user_path(@user)
                else
                    redirect_to @user
                end
            else
                redirect_to login_path, notice: "Unable to login. Please make sure your email and password are correct."
            end
        else
            redirect_to login_path, notice: "Unable To Log In"
        end
      end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    def omniauth
        @user = User.find_by(email: auth[:info][:email])
        return redirect_to login_path, notice: "Unable to log in." if @user && !@user.provider
        if request.env['omniauth.params']["user"] == "lab"
            @user = User.create_from_omniauth_lab(auth)
        elsif request.env['omniauth.params']["user"] == "company"
            @user = User.create_from_omniauth_company(auth)
        else
            @user = User.create_from_omniauth(auth)
        end
        if @user.valid?
            set_user
            User.send_welcome_email(@user)
            redirect_to @user
        else
            flash[:message] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    private 

    def session_params
        params.require(:user).permit(:first_name, :last_name, :password, :email)
    end

    def auth
        request.env['omniauth.auth']
    end


end
