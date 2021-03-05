class CompaniesController < ApplicationController
    before_action :verify_user_company_relationship, only: [:show. :edit]

    def index
    end

    def new
        @company = Company.new
        @user = User.new
    end

    def create
        if Company.find_by(name: company_params[:name]) || User.find_by(email: company_params[:user][:email])
            flash[:message] = "Unable to create #{company_params[:name]}"
            redirect_to new_company_path
        else
            @company = Company.new(name: company_params[:name])
            @user = User.new(company_params[:user])
            @user.super_admin = true
            @user.super_admin = true
            if @company.save && @user.save
                @company.users << @user
                set_user
                set_company
                binding.pry
                redirect_to @company
            else
                flash[:message] = @company.errors.full_messages
                redirect_to new_company_path
            end
        end
    end
    
    def show
        # if 
        @company = Company.find_by(id: params[:id])
    end
    
    def edit
        @company = Company.find_by(id: params[:id])
        @user = User.find_by(current_user)
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def company_params
        params.require(:company).permit(:name, user: [
            :first_name, 
            :last_name, 
            :email, 
            :password_digest,
            :belongs_to_company,
            :super_admin,
            :can_edit,
            ])
    end

    def verify_user_company_relationship
        return redirect_to root_path, notice: "Forbidden" unless current_user.company == current_company 
    end

end
