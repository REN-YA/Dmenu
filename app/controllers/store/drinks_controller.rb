class Store::DrinksController < ApplicationController

 def new
    @drink = Drink.new
    @store = Store.find(params[:store_id])
 end

 def create
    @drink = Drink.new(drink_params)
    @store = Store.find(params[:store_id])
    @drink.store_id = @store.id
    if @drink.save
      redirect_to store_store_drink_path(@store, @drink.id)
    else
      render 'new'
    end
 end

 def index
    @store = Store.find(params[:store_id])
    @categories = Category.where(store_id: @store)
    @genres = Genre.where(category_id: @categories)
    @drinks = Drink.where(genre_id: @genres)
 end

 def show
   @store = Store.find(params[:store_id])
   @drink = Drink.find(params[:id])
 end

 def edit
   @store = Store.find(params[:store_id])
   @drink = Drink.find(params[:id])
 end

 def update
   @store = Store.find(params[:store_id])
   @drink = Drink.find(params[:id])
    if @drink.update(drink_params)
      redirect_to store_store_drinks_path(@store, @drink.id)
    else
      render 'edit'
    end
 end

 def destory
 end

 private
 def drink_params
    params.require(:drink).permit(:name, :store_id, :category_id, :genre_id, :selling_price, :cost, :cost_rate, :material, :make)
 end

end
