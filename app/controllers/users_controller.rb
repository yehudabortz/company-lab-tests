class UsersController < ApplicationController
    before_action :user_can_view_user, only: [:show, :edit, :update]
    # skip_before_action :require_login, only: [:new] 


    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        set_customer_permissions
        if @user.save
            set_user
            redirect_to @user
        else
            render 'new'
        end

    end

    def index
    end

    def show
    end

    def edit
        find_user
    end

    def update
        find_user
        @user.update(user_params)
        redirect_to @user
    end

    def destroy
    end

    private 

    def user_params
        params.require(:user).permit(:first_name, :last_name, :password, :email, :birthdate, :gender, :phone, :dr_email)
    end

    def set_customer_permissions
        @user.is_customer = true
    end

end
