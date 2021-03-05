class Admin::TestsController < ApplicationController
    before_action  :require_login
    before_action  :has_company_admin_permissions?
    helper_method :has_company_admin_permissions?

    def index
        @tests = Test.all
    end

    def new
        @test = Test.new
        @test.unique_test_id = Test.generate_unique_test_id
    end

    def create
        @test = Test.new(test_params)
        @test.company = current_company
        if @test.save
            redirect_to admin_test_path(@test)
        else
            redirect_to new_admin_test_path, notice: @test.errors.full_messages
        end
    end

    def show
        set_test
    end

    def edit
        set_test
    end

    def update
        binding.pry
    end

    private

    def has_company_admin_permissions?
        redirect_to user_path(current_user), notice: "Restricted" unless logged_in? && current_user.super_admin
    end

    def test_params
        params.require(:test).permit(:unique_test_id, :mma, :creatinine)
    end

    def set_test
        @test = Test.find_by(id: params[:id])
    end

  end 