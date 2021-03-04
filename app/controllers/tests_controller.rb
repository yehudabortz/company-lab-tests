class TestsController < ApplicationController

    
    def new
        @test = Test.new
        @test.unique_test_id = Test.generate_unique_test_id
    end

    def create
        @test = Test.new(test_params)
        binding.pry
        if @test.save
            redirect_to @test
        else
            render "new"
        end
    end

    def index
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

    private

    def test_params
        params.require(:test).permit(:unique_test_id, :mma, :creatinine, :final_result, :verified)
    end


end
