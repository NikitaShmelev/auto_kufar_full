class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @posts = Post.paginate(page: params[:page], per_page: 3)
        # @paginate_check = false
        return @posts, @user
    end  
end
