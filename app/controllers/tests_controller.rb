class TestsController < ApplicationController
    before_action :require_login
    def index
        @tests = Test.belonging_to_user(current_user)
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
        @test = Test.find_by(id: params[:id])
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def new_registration
        @test = Test.new
    end

    def register
        if find_test_by_unique_id
            if !!current_user
                @test.user = current_user
                @test.save
                redirect_to user_test_path(current_user, @test)
            else
                redirect_to root_path
            end
        else
            redirect_to root_path, notic: "Unable to register test. "
        end

    end

    private

    def test_params
        params.require(:test).permit(:unique_test_id)
    end

    def find_test_by_unique_id
        @test = Test.find_by(unique_test_id: test_params[:unique_test_id])
    end

end
