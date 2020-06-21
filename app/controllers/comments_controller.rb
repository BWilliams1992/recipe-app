class CommentsController < ApplicationController
  before_action :find_article
  def create
    @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment =@article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end

    def find_article
      @article = Article.find(params[:article_id])
    end
end
