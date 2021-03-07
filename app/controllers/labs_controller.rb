class LabsController < ApplicationController
    # before_action :require_login

    def new
        @lab = Lab.new
        @user = User.new
    end

    def create
        @lab = Lab.new(name: lab_params[:name])
        @user = User.new(lab_params[:user])
        @lab.users << @user
        @user.belongs_to_lab = true
        if @lab.save && @user.save
            redirect_to lab_path @lab
        end
    end

    def index
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def lab_params
        params.require(:lab).permit(:name, user: [
            :first_name,
            :last_name,
            :email,
            :password_digest
            ])
    end
end
