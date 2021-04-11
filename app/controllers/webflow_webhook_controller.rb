class WebflowWebhookController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webflow_webhook, :webhook_params]

    def webflow_webhook
        binding.pry
        if webhook_params[:unique_test_id] 
            test = Test.find_by(unique_test_id: webhook_params[:unique_test_id].to_i)
            if test
                test.save
                user = User.find_or_create_by(email: webhook_params[:email])
                user.tests << test
                user.save
                user.update(user_params)
            end 
            render json: user
        end
        
        binding.pry
    end
    
    private
    
    def webhook_params
        params.require(:data).permit(:unique_test_id, :first_name, :last_name, :birthdate, :gender, :email, :phone_number, :dr_email)
    end

    def user_params 
        webhook_params.except("unique_test_id")
    end

end
