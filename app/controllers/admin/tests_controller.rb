class Admin::TestsController < ApplicationController
    before_action  :require_login
    before_action  :has_company_admin_permissions?

    def index
        @tests = Test.all
    end

    def new
        @test = Test.new
        @test.set_unique_test_id
    end

    private

    def has_company_admin_permissions?
        redirect_to user_path(current_user) unless logged_in? && current_user.belongs_to_company
        flash[:message] = "You do not have permissions"
    end

  end 