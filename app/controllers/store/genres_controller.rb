class Store::GenresController < ApplicationController
  def index
    @category = Category.new
    @store = Store.find(params[:store_id])
    @categories = Category.where(store_id: @store)
  end

  def create
    @category = Category.new(category_params)
    @store = Store.find(params[:store_id])
    @category.store_id = @store.id
    if @category.save
      redirect_to store_store_categories_path(@store)
    else
      @store = Store.find(params[:store_id])
      @categories = Category.where(store_id: @store.id)
      render 'index'
    end
  end

  def edit
    @store = Store.find(params[:store_id])
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
     @store = Store.find(params[:store_id])
     @category.store_id = @store.id
    if @category.update(category_params)
      redirect_to store_store_categories_path(@category.store_id, @category.id)
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @store = Store.find(params[:store_id])
    @category.destroy
    redirect_to store_store_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :store_id)
  end

end
