class Admin::HomesController < Admin::ApplicationController

  def top
    @orders = Order.page(params[:page])
  end

  def about
    #headerのログアウト機能ができるまでの暫定でログアウト機能用意(index画面にlogoutリンクを用意)
  end

end
