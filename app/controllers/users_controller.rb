class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]
    before_action :only_user_can_view, except: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        set_customer_permissions
        if @user.save
            # UserMailer.welcome_email(@user).deliver_now
            set_user
            redirect_to @user
        else
            render 'new'
        end

    end

    def show
        binding.pry
    end

    def edit
        find_user
    end

    def update
        find_user
        @user.update(user_params)
        redirect_to @user, notice: "Profile Updated"
    end

    def deactivate
        find_user.active = false
        redirect_to root_path
    end
    
    def destroy
        find_user.delete 
        session[:user_id] = nil
        redirect_to root_path
    end

    private 

    def user_params
        params.require(:user).permit(:first_name, :last_name, :password, :email, :birthdate, :gender, :phone, :dr_email)
    end

    def set_customer_permissions
        @user.is_customer = true
    end

end
