class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def search
    if current_member
      @member = current_member
      @posts = @member.posts
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_member
    if @post.save
      flash[:notice_newpost] = "Thank you. Your reivew is posted!"
      redirect_to :posts
    else
      render "new"
    end
  end

  def edit
    @post = current_member.posts.find(params[:id])
  end

  def update
    @post = current_member.posts.find(params[:id])
    @post.assign_attributes(post_params)
    if @post.save
      flash[:notice_post_edit] = "Successfully updated"
      redirect_to :search
    else
      render "edit"
    end
  end

  def destroy
    @post = current_member.posts.find(params[:id])
    @post.destroy
    flash[:notice_post_delete] = "Successfully deleted"
    redirect_to :search
  end

  private
  def post_params
    attrs = [:term, :campus, :title, :body, :rate, :level, :hw, :project, :language, :mid, :final]
    params.require(:post).permit(attrs)
  end
end
