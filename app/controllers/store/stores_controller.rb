class Store::StoresController < ApplicationController

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to store_store_path(@store.id)
    else
      render :new
    end
  end
  
  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
    @store = Store.find(params[:id])
  end
  
  private
    def store_params
      params.require(:store).permit(:name, :email, :password_digest)
    end
end
