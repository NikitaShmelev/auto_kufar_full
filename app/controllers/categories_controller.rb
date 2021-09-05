class CategoriesController < ApplicationController
    # before_action :set_category, only: :show
  
    def index
      @categories = Category.all
      
    end

    def show
      @posts = Post.all
      @category = Category.all.find(params[:id])
    end
  
    # private
  
    # def set_category
    #   @category = Category.find(params[:id])
    # end
end
  