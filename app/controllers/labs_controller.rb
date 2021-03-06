class LabsController < ApplicationController
    before_action :require_login, except: [:new, :create]
    before_action :verify_user_lab_relationship, only: [:show, :edit]


    def new
        @lab = Lab.new
        @user = User.new
    end

    def create
        @lab = Lab.new(name: lab_params[:name])
        @user = User.new(lab_params[:user])
        @lab.users << @user
        set_new_lab_super_admin
        if @lab.save && @user.save
            set_user
            redirect_to lab_path @lab
        else
            render 'new'
        end
    end

    def show
        find_lab
    end

    def edit
        find_lab
        @user = User.find_by(id: current_user.id)
    end

    def update
        find_lab
        find_user
        @lab.update(name: lab_params[:name])
        @user = User.update(lab_params[:user])
        flash[:message] = "Lab Updated"
        redirect_to admin_user_path(current_user)
    end

    def longest_lab_name
        @lab = Lab.longest_lab_name.first
    end

    private

    def lab_params
        params.require(:lab).permit(:name, user: [
            :first_name,
            :last_name,
            :email,
            :password
            ])
    end

    def find_lab
        @lab = Lab.find_by(id: params[:id])
    end

    def verify_user_lab_relationship
        return redirect_to root_path, notice: "Forbidden" unless current_user.lab_id == params_id_integer
    end

    def set_new_lab_super_admin
        @user.belongs_to_lab = true
        @user.lab_super_admin = true
    end
end
