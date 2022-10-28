class UsersControllers < ApplicationController
    before_action :require_logged_in, only: [:index, :show]
    before_action :redirect_logged_out, only: [:new,:create]

    def new
        render :new
    end

    def create
        user = User.new(user_params)
        if user.save
            login!(user)
            redirect_to users_url
        else
            flash.now[:errors] = user.errors.full_messages
            render :new
        end
    end

    def index
        render :index
    end

    def show
        render :show
    end

    private
    
    def user_params
        params.require(:user).permit(:username, :password)
    end 

end
