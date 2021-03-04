class CompaniesController < ApplicationController
    def new
        @company = Company.new
        @user = @company.users.build(belongs_to_company: true, super_admin: true)
    end

    def create
        @company = Company.new(company_params)
        if @company.save
            redirect_to @company
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
    
    def company_params
        binding.pry
        params.require(:company).permit(:name, users_attributes: [:first_name, :password])
    end
end
