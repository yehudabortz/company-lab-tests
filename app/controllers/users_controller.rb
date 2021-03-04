class UsersController < ApplicationController
    # before_action :require_login
    # skip_before_action :require_login, only: [:new] 


    def new
        @user = User.new
    end

    def create
        @user = User.find_or_create_by(user_params[:user])
        set_user
        redirect_to @user
    end

    def index
    end

    def show
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update

    end

    def destroy
    end

    private 

    def user_params
        params.require(:user).permit(:first_name, :last_name, :password, :email)
    end

end
