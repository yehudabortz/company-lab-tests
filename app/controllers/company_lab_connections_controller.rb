class CompanyLabConnectionsController < ApplicationController
    before_action :require_login, :is_admin?
    before_action :redirect_unless_company_super_admin?, only: [:new]

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
            redirect_to admin_user_path(current_user), notice: "Connection Pending"
        else
            redirect_to admin_user_path(current_user), notice: "Unable to connect"
        end
    end

    def index
        if !current_lab.nil?
            @company_lab_connections = CompanyLabConnection.current_company_lab_connections(current_lab)
        elsif !current_company.nil?
            @company_lab_connections = CompanyLabConnection.current_company_lab_connections(current_company)
        end
        if @company_lab_connections.empty?
            flash[:message] = "No connections yet."
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        connection = find_company_lab_connection
        update_connection_status_sucessful
        if @company_lab_connection.save
            redirect_to admin_user_path(current_user), notice: "Connection succesful"
        else
            redirect_to admin_user_path(current_user), notice: "Unable to connect"
        end
    end
    
    def destroy
        find_company_lab_connection.destroy
        redirect_to current_user
    end
    

    private 

    def company_lab_connection_params
        params.require(:company_lab_connection).permit(user: [
            :email
        ])
    end

    def find_company_lab_connection
        @company_lab_connection = CompanyLabConnection.find_by(id: params[:id])
    end

    def update_connection_status_sucessful
        @company_lab_connection.pending = false
        @company_lab_connection.accepted = true
        @company_lab_connection.completed = true
    end

end
