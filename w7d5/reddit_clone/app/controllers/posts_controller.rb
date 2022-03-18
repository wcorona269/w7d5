class PostsController < ApplicationController

    before_action :is_author?, only: [:edit, :update, :destroy]

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to sub_post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content, :author_id, :sub_id)
    end

end
