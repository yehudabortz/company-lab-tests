class TestsController < ApplicationController

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
        @test.build_user

    end

    def register
        if find_test_by_unique_id
            binding.pry
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
        params.require(:test).permit(:unique_test_id, :mma, :creatinine, :final_result, :verified, :user_attributes => [
            :first_name,
            :last_name,
            :email,
            :birthdate,
            :gender,
            :phone,
            :dr_email
        ])
    end

    def find_test_by_unique_id
        @test = Test.find_by(unique_test_id: test_params[:unique_test_id])
    end

end
