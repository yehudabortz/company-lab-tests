class CompaniesController < ApplicationController
    before_action :verify_user_company_relationship, only: [:show, :edit]

    def new
        @company = Company.new
        @user = User.new
    end

    def create
        @company = Company.new(name: company_params[:name])
        @user = User.new(company_params[:user])
        @user.super_admin = true
        @user.belongs_to_company = true
        @company.users << @user
        @user.company = @company
        if @company.save && @user.save
            set_user
            redirect_to @company
        else
            flash[:message] = @company.errors.full_messages
            redirect_to new_company_path
        end
    end
    
    def show
        find_company
        @users = User.of_current_company(@company)
    end
    
    def edit
        @company = Company.find_by(id: params[:id])
        @user = User.find_by(id: current_user.id)
    end
    
    def update
        find_company
        @user = current_user
        @user.update(company_params[:user])
        @company.update(name: company_params[:name])
        flash[:message] = "Company Profile Updated"
        redirect_to company_path(@company)
    end
    
    def destroy
    end
    
    private
    
    def company_params
        params.require(:company).permit(:name, user: [
            :first_name, 
            :last_name, 
            :email, 
            :password,
            :belongs_to_company,
            :super_admin,
            :can_edit,
            ])
    end

    def verify_user_company_relationship
        return redirect_to root_path, notice: "Forbidden" unless current_user.company_id == params_id_integer && current_user.super_admin
    end

    def find_company
        @company = Company.find_by(id: params[:id])
    end

end
