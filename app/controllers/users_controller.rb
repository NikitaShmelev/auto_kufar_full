class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @posts = Post.all
        return @posts, @user
    end  
end
