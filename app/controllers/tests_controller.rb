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
        @test = Test.find_by(test_params[:unique_test_id])
        binding.pry
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


end
