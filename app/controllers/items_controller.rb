class ItemsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    respond_with Item.all
  end

  def create
    respond_with Item.create(item_params)
  end

  def update
    respond_with Item.find(params[:id]).update_attributes(item_params)
  end

  def destroy
    respond_with Item.destroy(params[:id])
  end

private
  def item_params
    params.require(:item).permit(:summary, :is_completed)
  end
end
