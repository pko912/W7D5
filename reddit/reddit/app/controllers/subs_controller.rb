class SubsControllers < ApplicationController


    def new
        render :new
    end

    def index
        render :index
    end

    def show
        render :show
    end

    def update
    end

    def edit
        render :edit
    end

    def create
        user_id = params[:user_id]
        
    end

    def destroy
    end
end