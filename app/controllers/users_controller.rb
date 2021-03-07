class UsersController < ApplicationController
    # before_action :require_login
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
            redirect_to root_path, notice: "#{@user.errors.full_messages.join(" ")}"
        end

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
        params.require(:user).permit(:first_name, :last_name, :password_digest, :email, :birthdate, :gender, :phone, :dr_email)
    end

    def set_customer_permissions
        @user.is_customer = true
    end

end
