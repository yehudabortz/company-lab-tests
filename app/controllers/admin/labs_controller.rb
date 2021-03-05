class Admin::LabsController < ApplicationController
    # before_action :require_login

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

    def lab_params
        params.require(:lab).permit(:name)
    end
end
