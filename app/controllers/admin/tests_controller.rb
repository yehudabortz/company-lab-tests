class Admin::TestsController < ApplicationController
    before_action :require_login
    before_action :has_access_to_company_tests?
    before_action :redirect_unless_lab_super_admin?, only: [:edit, :update]
    before_action :redirect_unless_company_super_admin?, only: [:new, :create]

    helper_method :has_company_admin_permissions?, :require_test_ownership

    def index
        if current_user.belongs_to_company
            @tests = Test.belonging_to_current_company(current_company)
        elsif current_user.belongs_to_lab
            @tests = current_lab.all_tests_through_company_connections(current_lab)
        end
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
        @test.update(test_params)
        if @test.update(test_params)
            @test.calculate_result
            @test.save
            redirect_to admin_test_path(@test)
        else
            redirect_to admin_test_path(@test), notice: display_model_errors
        end
    end

    private

    def test_params
        params.require(:test).permit(:unique_test_id, :mma, :creatinine, :verified)
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