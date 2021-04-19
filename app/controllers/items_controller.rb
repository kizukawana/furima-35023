class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :require_login]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order("id ASC")
  end
   
  def new
    @item = Item.new
  end
 
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
 
  def show
  end

  def edit
  end

  def update
    if @item.update(item_params) 
      redirect_to item_path 
    else
      render :edit
    end
  end

  def require_login
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :delivery_fee_id, :area_id, :delivery_day_id, :price ).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    redirect_to root_path unless item.user_id == current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

