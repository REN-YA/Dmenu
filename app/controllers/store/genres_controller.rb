class Store::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @store = Store.find(params[:store_id])
    @genres = Genre.where(store_id: @store)
  end

  def create
    @genre = Genre.new(genre_params)
    @store = Store.find(params[:store_id])
    @genre.store_id = @store.id
    if @genre.save
      redirect_to store_store_genres_path(@store)
    else
      @store = Store.find(params[:store_id])
      @genres = Genre.where(store_id: @store.id)
      render 'index'
    end
  end

  def edit
    @store = Store.find(params[:store_id])
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to store_store_genres_path
    else
      render 'edit'
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @store = Store.find(params[:store_id])
    @genre.destroy
    redirect_to store_store_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :store_id, :category_id)
  end

end
