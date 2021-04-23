class ItemUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  def index
      @item_user_information = ItemUserInformation.new
  end
  def create
      @item_user_information = ItemUserInformation.new(item_user_information_params)
      if @item_user_information.valid?
          pay_item
          @item_user_information.save
          redirect_to root_path
      else
          render :index
      end
  end
  private
  def item_user_information_params
      params.require(:item_user_information).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id,token: params[:token])
  end
  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: item_user_information_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  def set_item
      @item = Item.find(params[:item_id])
  end
  def move_to_index
      if current_user.id == @item.user.id || @item.item_user.present?
          redirect_to root_path
      end
  end
end