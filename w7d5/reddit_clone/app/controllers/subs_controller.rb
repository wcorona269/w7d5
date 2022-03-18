class SubsController < ApplicationController
    def new
        @sub = Sub.new
    end

    def index
        @subs = Sub.all
    end

    def create
        @sub = Sub.new(sub_params)
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find(params[:id])
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def destroy
        @sub = Sub.find(params[:id])
        @sub.destroy
        redirect_to subs_url
    end

    private
    def sub_params
        params.require(:sub).permit(:title, :description, :moderator_id)
    end
end
