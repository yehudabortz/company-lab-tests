class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    def new
    end
    
    def create

    end
    
    def destroy
    end

    def omniauth
        @user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.first_name = auth[:info][:first_name]
            u.last_name = auth[:info][:last_name]
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex(16)
        end
        if @user.valid?
            redirect_to @user
        else
            flash[:message] = @user.errors.full_messages.join(", ")
            # binding.pry
            redirect_to new_user_path
        end
    end

    private 

    def auth
        request.env['omniauth.auth']
    end

end
