class ApplicationController < ActionController::Base
  helper_method :current_store
  # before_action :login_required

  private

  def current_store
    @current_store ||= Store.find_by(id: session[:store_id]) if session[:store_id]
  end
  
  # def login_required
  #   redirect_to login_path unless current_store
  # #ログインしていない限り、ログイン画面にレダイレクト
  # end
end
