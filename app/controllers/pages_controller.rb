class PagesController < ApplicationController
  # def home
  # end
  before_action :authenticate_user!

  def create
    @page = Page.new(page_params)
    @post = @page.post
    if @page.save
      respond_to :js
    else
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def destroy
    @page = Page.find_by(id: params[:id])
    @post = @page.post
    if @page.destroy
      respond_to :js
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
  end

  private
    def page_params
      params.required(:page).permit(:user_id, :post_id, :body, :page)
    end

end
