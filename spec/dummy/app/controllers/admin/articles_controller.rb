# coding: utf-8

class Admin::ArticlesController < Admin::BaseController

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(article_attributes)
    render "edit"
  end

  def destroy
  end
end