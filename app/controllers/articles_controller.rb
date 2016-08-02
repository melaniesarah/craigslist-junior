class ArticlesController < ApplicationController

  # GET /categories/:category_id/articles
  def index
    #1st you retrieve the category thanks to params[:category_id]
    category = Category.find(params[:category_id])
    #2nd you get all the articles of this category
    @articles = category.articles
  end

  # GET /categories/:category_id/articles/:id
  def show
    category = Category.find(params[:category_id])
    #2nd you retrieve the article thanks to params[:id]
    @article = category.articles.find(params[:id])
  end

  # GET /categories/:category_id/articles/new
  def new
    category  = Category.find(params[:category_id])
    #2nd you build a new one
    @article = category.articles.build
  end

  # GET /categories/:category_id/articles/:id/edit
  def edit
    category  = Category.find(params[:category_id])
    #2nd you retrieve the article thanks to params[:id]
    @article = category.articles.find(params[:id])
  end

  # POST /posts/:post_id/comments
  def create
    #1st you retrieve the post thanks to params[:post_id]
    category = Category.find(params[:category_id])
    #2nd you create the comment with arguments in params[:comment]
    @article = category.articles.create(params[:article])

    if @article.save
      #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
      redirect_to categories_url
    else
      render action: "new"
    end
  end

  # DELETE /posts/:post_id/comments/1
  def destroy
   category = Category.find(params[:category_id])
   @article = category.articles.find(params[:id])
   @article.destroy
   redirect_to category_articles_path
  end

 private
   def article_params
     params.require(:article).permit(:title, :desciption, :price, :user_email, :edit_url, :category_id)
   end
end
