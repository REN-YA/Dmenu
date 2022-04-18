class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    store = Store.find_by(email: session_params[:email])
    #送られたメースアドレスでユーザーを検索

    if store&.authenticate(session_params[:password])
    session[:store_id]=store.id
    redirect_to root_path, notice: 'ログインしました'
    else
      render :new
    end
  end
  
  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end


end