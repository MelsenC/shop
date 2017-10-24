class ItemsController < ApplicationController
  def index
    render json: Item.order(:id)
  end

  def update
    item = Item.find(params[:id])
    item.update_attributes(item_params)
    render json: item
  end

  def create
    item = Item.create(item_params)
    render json: item
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render body: nil, status: :no_content
  end

  private

  def item_params
    params.require(:item).permit(:done, :title)
  end
end
