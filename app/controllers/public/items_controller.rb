class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!,except:[:index]
  def index
    @items = Item.page(params[:page])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
end
