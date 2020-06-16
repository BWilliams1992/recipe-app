class WelcomeController < ApplicationController 

  def home
    @articles = Article.all
    @pinned = @articles.select { |article| article.pinned? }
  end

end