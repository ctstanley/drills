class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    article = current_user.articles.new(article_params)
    if article.save
      redirect_to article_path(article)
    else
      redirect
  end

  def edit
  end

  def index
    @articles = current_user.articles
  end

  def show
  end

  def update
  end

  def destroy
  end
  private

    def article_params
      params.require(:article).permit(:title, :content)
    end

    def set_user_article
      @article = current_user.articles.find_by({id: params[:id]})
      unless @article
        redirect_to articles_path
      end
    end
end
