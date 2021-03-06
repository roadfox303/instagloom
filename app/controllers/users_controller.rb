class UsersController < ApplicationController
  before_action :set_profile, only: [:edit, :show, :favorite]
  def set_profile
    @favorite_num = current_user.favorites.length
    @article_num = Article.where(user_id: current_user.id).length
  end

  def new
    if params[:back]
      redirect_to user_path(@user.id)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def favorite
    if logged_in?
      @user = User.find(params[:id])
      @favorites = @user.favorites.reverse
    else
      redirect_to new_session_path
    end
  end

  def edit
    if params[:id].to_i == current_user.id
      @user = User.find(params[:id])
      if params[:back]
        redirect_to user_path(@user.id)
      end
    else
      redirect_to edit_user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:image].blank?
      params[:user].delete("image")
      params[:user].delete("image_cache")
    end
    if params[:back]
      redirect_to user_path(@user.id)
    elsif @user.update(user_params)
      flash[:success] = "Your account was updated"
      redirect_to user_path(current_user.id)
    else
      render 'edit'
    end

  end

  def show
    if logged_in?
      # @user = current_user
      # @articles = Article.where(user_id: current_user.id).reverse
      @user = User.find(params[:id])
      if logged_in?
        @favorites = current_user.favorites
      end
      @articles = Article.where(user_id: @user.id).reverse
    else
      redirect_to new_session_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :comment, :image, :image_cache, :remove_image)
  end
end
