class ArticlesController < ApplicationController
  before_action :set_id, only: [:edit,  :destroy, :update, :show]
  before_action :set_profile, only: [:edit, :show]
  def set_profile
    if logged_in?
      @favorite_num = current_user.favorites.length
      @article_num = Article.where(user_id: current_user.id).length
    end
  end

  def index
    @users = User.all
    @articles = Article.all.reverse
    if logged_in?
      @favorites = current_user.favorites
    end

  end

  def new
    @favorite_num = current_user.favorites.length
    @article_num = Article.where(user_id: current_user.id).length
    if params[:back]
      @article = Article.new(article_params)
    else
      @article = Article.new
    end
  end

  def confirm
    @article = Article.new(article_params)
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if params[:back]
      redirect_to user_path(current_user.id)
    else
      article_check(@article.update(article_params), "create")
      ContactMailer.notice_mail(current_user).deliver
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    if @article.user_id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @article = Article.find(params[:id])
    article_check(@article.update(article_params), "update")
  end

  def destroy
    @article.destroy
    redirect_to user_path(current_user.id), notice:"記事を削除しました"
  end

  private
  def article_params
    params.require(:article).permit(:id, :comment, :image, :image_cache, :remove_image)
  end

  def set_id
    @article = Article.find(params[:id])
  end

  def article_check(check, name)
    if check
      case name
      when "create" then
      redirect_to user_path(current_user.id), notice: "記事を投稿しました"
      when "update" then
      redirect_to user_path(current_user.id), notice: "記事を編集しました"
      end
    else
      redirect_to user_path(current_user.id), notice: "投稿できませんでした"
    end
  end
end
