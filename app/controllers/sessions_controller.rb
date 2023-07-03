class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session
      log_in user
      redirect_to  top# ログイン後にログイン後の画面にリダイレクトする
    else
      flash.now[:danger] =  'Invalid email/password combination'#エラーメッセージ表示
      render 'new', status: :unprocessable_entity
    end
  end
end
