class Admin::UsersController < ApplicationController
    before_action :require_login

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.company = current_company
        @user.belongs_to_company = true
        if @user.save
            redirect_to company_path(current_user)
        else
            render 'new'
        end
    end

    def index
        @users = current_company.company_customers(current_company)
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
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
