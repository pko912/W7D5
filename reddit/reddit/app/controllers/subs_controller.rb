class SubsControllers < ApplicationController
    before_action :require_logged_in, except: [:index,:show]

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
        @sub = Sub.find(params[:id])

        if @sub.update(sub_params)
            redirect_to users_url
        else
            render :edit
        end
    end

    def edit
        render :edit
    end

    def create
        moderator_id = params[:user_id]
        @sub = Sub.new(sub_params)
        @sub.moderator_id = moderator_id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            redirect_to new_sub_url
        end
    end

    def destroy
        Sub.destroy(id: params[:id])
        redirect_to users_url
    end

    def sub_params
        params.require(:sub).permit(:title,:description)
    end
end