class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: { status: :ok, articles: @articles }
  end

  def show
    @article = Article.find(params[:id])
    render json: { status: :ok, article: @article }
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: { status: :ok, article: @article }
    else
      render json: { status: :unprocessable_entity, errors: @article.errors }
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      render json: { status: :ok, article: @article }
    else
      render json: { status: :unprocessable_entity, errors: @article.errors }
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    render json: { status: :ok, article: @article }
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
