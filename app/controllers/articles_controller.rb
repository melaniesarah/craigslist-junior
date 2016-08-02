class ArticlesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @article = @category.articles.create(article_params)
    redirect_to category_path(@category)
  end

  def destroy
   @category = Category.find(params[:category_id])
   @article = @category.articles.find(params[:id])
   @article.destroy
   redirect_to category_path(@category)
 end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

 private
   def article_params
     params.require(:article).permit(:title, :desciption, :price, :user_email, :edit_url, :category_id)
   end
end
