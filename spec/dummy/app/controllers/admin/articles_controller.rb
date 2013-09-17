# coding: utf-8

class Admin::ArticlesController < Admin::BaseController

  def edit
    @article = Article.find(params[:id])
    @article.build_page.save unless @article.page
  end

  def update
    @article = Article.find(params[:id])
    puts article_params
    @article.update_attributes(article_params)
    render "edit"
  end

  def destroy
  end

  private
    def article_params
      params.require(:article).permit!
    end
end