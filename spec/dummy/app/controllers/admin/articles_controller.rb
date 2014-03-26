# coding: utf-8

class Admin::ArticlesController < Admin::BaseController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    render "edit"
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to [:edit, :admin, @article], notice: "Article created"
    else
      render "edit", alert: "Error"
    end
  end

  def edit
    @article = Article.find(params[:id])
    @article.build_page.save unless @article.page
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    render "edit"
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to [:admin, :articles]
  end

  private
    def article_params
      params.require(:article).permit!
    end
end