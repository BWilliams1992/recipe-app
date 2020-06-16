class ArticlesController < ApplicationController
  authorize_resource
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save 
      flash[:notice] = "Article successfully created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article successfully updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article deleted"
  end

  def index 
    @articles = Article.all
  end

  private

  def article_params 
    params.require(:article).permit(:title, :body, :pinned)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
