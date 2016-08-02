class CategoriesController < ApplicationController
  # def new #equivalent to post '/categories' do
  #   @category = Category.new
  # end

  # def create
  #   @category = Category.new(category_params)

  #   if @category.save
  #     redirect_to @category
  #   else
  #     render 'new'
  #   end
  # end

  # def edit
  #   @category = Category.find(params[:id])
  # end

  # def update
  #   @category = Category.find(params[:id])

  #   if @category.update(category_params)
  #     redirect_to @category
  #   else
  #     render 'edit'
  #   end
  # end

  # def destroy
  #   @category = Category.find(params[:id])
  #   @category.destroy

  #   redirect_to categories_path
  # end

  def show
    @category = Category.find(params[:id])
    redirect_to category_articles_path(@category)
  end

  def index
    @categories = Category.all
  end

  # private
  # def category_params
  #   params.require(:category).permit(:title, :text)
  # end

end
