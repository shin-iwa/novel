class PagesController < ApplicationController
  # def home
  # end
  before_action :authenticate_user!
  before_action :set_page, only: %i(show destroy edit update)

  def create
    @page = Page.new(page_params)
    @post = @page.post
    if @page.save
      # respond_to :js
      # redirect_to "/"
      redirect_to edit_post_path(@post)
    else
      redirect_to  edit_post_path(@post)
      flash[:alert] = "投稿に失敗しました"
    end
  end

  def destroy
    # @page = Page.find_by(id: params[:id])
    @post = @page.post
    if @page.destroy
      respond_to :js
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
  end

  def show
  end

  def edit
    @post = @page.post
    # @pages = @post.pages.includes(:user)
  end
  
  def update
    if @page.update(update_page_params)
      redirect_to '/'
      flash[:notice] = "投稿が修正されました"
    else
      redirect_to '/'
      flash[:alert] = "投稿の修正に失敗しました"
    end
  end

  private
    def page_params
      params.require(:page).permit(:user_id, :post_id, :title, :body, :page)
    end

    def update_page_params
      params.require(:page).permit(:user_id, :post_id, :title, :body, :page, id: params[:id])
    end

    def set_page
      @page = Page.find_by(id: params[:id])
    end

end
