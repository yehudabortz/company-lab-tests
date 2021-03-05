class Admin::UsersController < ApplicationController
    before_action :require_login
    
    def new
        @user = User.new
    end

    def create
    end

    def index
    end

    def show
        find_user
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:first_name)
    end
end
