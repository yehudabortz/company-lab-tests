class Admin::UsersController < ApplicationController

    def new
    end

    def create
    end

    def index
    end

    def show
        set_user
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
