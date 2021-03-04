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
        binding.pry
    end

    private

    def has_company_admin_permissions?
        redirect_to user_path(current_user), notice: "Restricted" unless logged_in? && current_user.super_admin
    end

    def test_params
        params.require(:test).permit(:unique_test_id, :mma, :creatinine, :final_result, :verified)
    end

  end 