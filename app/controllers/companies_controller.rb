class CompaniesController < ApplicationController
    before_action :verify_user_company_relationship, only: [:show, :edit]

    def index
    end

    def new
        @company = Company.new
        @user = User.new
    end

    def create
        @company = Company.new(name: company_params[:name])
        @user = User.new(company_params[:user])
        @user.super_admin = true
        @user.super_admin = true
        @company.users << @user
        @user.company = @company
        if @company.save && @user.save
            set_user
            redirect_to @company
        else
            binding.pry
            flash[:message] = @company.errors.full_messages
            redirect_to new_company_path
        end
    end
    
    def show
        find_company
        @users = User.users_of_current_company(@company)
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
        return redirect_to root_path, notice: "Forbidden" unless current_user.company_id == params_id_integer
    end

    def find_company
        @company = Company.find_by(id: params[:id])
    end



end
