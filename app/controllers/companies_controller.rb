class CompaniesController < ApplicationController

    def new
        @company = Company.new
        @company.users.build
    end

    def create
        if Company.find_by(name: company_params[:name])
            flash[:messeag] = "Unable to create #{company_params[:name]}"
            redirect_to new_company_path
        else
            @company = Company.new(company_params)
            if @company.save
                @user = @company.users.last
                set_user
                redirect_to @company
            else
                flash[:messeag] = @company.errors
                redirect_to new_company_path
            end
        end
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
