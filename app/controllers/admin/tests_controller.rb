class Admin::TestsController < ApplicationController
    before_action :require_login
    before_action :has_company_admin_permissions?, except: [:show]
    before_action only:[:show, :edit, :update, :destroy] do
        require_test_ownership(test_belongs_to_company)
    end

    helper_method :has_company_admin_permissions?, :require_test_ownership

    def index
        @tests = Test.belonging_to_current_company(current_company)
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
        find_test
    end

    def edit
        find_test
    end

    def update
        find_test
        @test.mma = test_params[:mma]
        @test.creatinine = test_params[:creatinine]
        @test.calculate_result
        @test.save
        redirect_to admin_test_path(@test)
    end

    private

    def test_params
        params.require(:test).permit(:unique_test_id, :mma, :creatinine)
    end

    def has_company_admin_permissions?
        redirect_to user_path(current_user), notice: "Restricted" unless logged_in? && current_user.super_admin
    end

    def find_test
        @test = Test.find_by(id: params[:id])
    end

    def test_belongs_to_company
        if !current_company.nil?
            current_user.company.test_ids.include?(params_id_integer)
        end
    end
    
  end 