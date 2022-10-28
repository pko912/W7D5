class SessionsControllers < ApplicationController
    before_action :redirect_logged_out, only: [:new,:create]
    before_action :redirect_logged_in, only: [:destroy]
    
    def new
        render :new
    end


    def create
        @user = user.find_by_credentials(
            username: params[:user][:username]
            password: params[:user][:password]
        )
        if @user
            login!(@user)
            redirect_to users_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end
    
end
