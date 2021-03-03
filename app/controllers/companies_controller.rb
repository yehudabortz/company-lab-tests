class CompaniesController < ApplicationController
    def new
    end

    def create
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
        params.require(:company).permit(:name)
    end
end
