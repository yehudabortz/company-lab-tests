class CompaniesController < ApplicationController

    def new
        @company = Company.new
        @company.users.build
    end

    def create
        @company = Company.find_or_create_by(name: company_params[:name])
        redirect_to @company
    end
    
    def index
    end
    
    def show
        @company = Company.find_by(id: params[:id])
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def company_params
        params.require(:company).permit(:name, users_attributes: [
            :first_name, 
            :last_name, 
            :email, 
            :password_digest,
            :belongs_to_company,
            :super_admin,
            :can_edit,
            ])
    end

end
