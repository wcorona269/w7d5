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
        @post = Post.find_by(params[:id])
    end

    def update
        @post = Post.new(post_params)
        if @post.update
            redirect_to sub_post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def destroy
        @post = Post.find_by(params[:id])
        @post.destroy
        redirect_to subs_url
    end

    private
    def post_params
        params.require(:post).permit(:title, :url, :content, :author_id, :sub_id)
    end

end
