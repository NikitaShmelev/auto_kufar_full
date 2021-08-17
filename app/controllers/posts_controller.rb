class PostsController < ApplicationController
  
    def index
      @posts = Post.all
    #   @posts = Post.paginate(page: params[:page], per_page: 5)
      @users = User.all
      return @posts, @users
    end
  
    def show
      @post = Post.find(params[:id])
    end
  
    def edit
      @post = Post.find(params[:id])
    end

    def new
      @post = Post.new      
    end

    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit
      end
    end

    def create
      @post = Post.new(post_params)
      @post.owner_id = current_user.id
      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @post.destroy
      respond_to do |format|
        format.html { redirect_to root, notice: 'Post was successfully deleted.' }
        format.json { head :no_content }
      end
    end

    private
    

    def post_params
      params.require(:post).permit(
        :title,
        :body,
        :owner_id,
        :price,
        :image
       )
    end

  end