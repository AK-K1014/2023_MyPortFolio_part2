class ApplicationController < ActionController::Base
  #どのコントローラからでもログイン関連のメソッドを呼び出せる
  include SessionsHelper
end
