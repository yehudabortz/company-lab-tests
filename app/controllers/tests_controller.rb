class TestsController < ApplicationController
    before_action :require_login
    before_action :can_register_test?, only: [:new]
    before_action :user_can_view_user, except: [:new_registration, :register]

    def index
        if params[:user_id] && current_company
            @tests = Test.belonging_to_user(User.find( params[:user_id])).where(company_id: current_company.id)
        else
            @tests = Test.belonging_to_user(User.find( params[:user_id]))
        end

    end

    def new
        @test = Test.new
    end

    def create
        @test = Test.new(test_params)
        if @test.save
            redirect_to @test
        else
            render "new"
        end
    end

    def show
        find_test
    end

    def new_registration
        redirect_to edit_user_path(current_user), notice: "Complete your profile to register a test." unless customer_has_provided_all_info
        @test = Test.new
    end

    def register
        if find_test_by_unique_id
            if !!current_user
                @test.user = current_user
                @test.save
                redirect_to user_test_path(current_user, @test)
            else
                redirect_to root_path, notice: "Unable to register test. Make sure the correct id was entered."
            end
        else
            redirect_to root_path, notice: "Unable to register test. Make sure the correct id was entered."
        end

    end

    private

    def test_params
        params.require(:test).permit(:unique_test_id)
    end

    def find_test
        @test = Test.find_by(id: params[:id])
    end

    def find_test_by_unique_id
        @test = Test.find_by(unique_test_id: test_params[:unique_test_id])
    end

end
