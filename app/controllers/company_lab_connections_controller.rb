class CompanyLabConnectionsController < ApplicationController
    # before_action :require_login
    # skip_before_action :require_login, only: [:new] 


    def new
        @company_lab_connection = CompanyLabConnection.new
        @user = User.new # email used to find and associate company and lab
    end
    
    def create
        @company_lab_connection = CompanyLabConnection.new
        if user = User.find_by(email: company_lab_connection_params[:user][:email])
            @company_lab_connection.company = current_company
            @company_lab_connection.lab = user.lab
            @company_lab_connection.pending = true
            @company_lab_connection.save
            binding.pry
            redirect_to admin_user_path(current_user), notice: "Connection Pending"
        else
            redirect_to admin_user_path(current_user), notice: "Unable to connect"
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

    def company_lab_connection_params
        params.require(:company_lab_connection).permit(user: [
            :email
        ])
    end

end
