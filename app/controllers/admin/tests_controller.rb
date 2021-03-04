class Admin::TestsController < ApplicationController
    def index
  
    end

    def new
        @test = Test.new
        @test.set_unique_test_id
    end
  end 