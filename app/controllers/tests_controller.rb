class TestsController < ApplicationController
    def new
        @test = Test.new
    end

    def create
    end

    def index
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def test_params
        params.require(:test).permit(:mma, :creatinine, :final_result, :verified)
    end
end
