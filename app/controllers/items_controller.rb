class ItemsController < ApplicationController
  def index
    render json: Item.order(:id)
  end

  def update
    item = Item.find(params[:id])
    item.update_attributes(item_params)
    render json: item
  end

  private

  def item_params
    params.require(:item).permit(:done)
  end
end
