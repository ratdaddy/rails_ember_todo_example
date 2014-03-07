class ItemsController < ApplicationController
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  before_filter :authorize_for_item!, only: [:update, :destroy]
  respond_to :json

  def index
    respond_with current_user.items
  end

  def create
    respond_with current_user.items.create(item_params)
  end

  def update
    respond_with @item.update_attributes(item_params)
  end

  def destroy
    respond_with @item.destroy
  end

private
  def item_params
    params.require(:item).permit(
      :summary,
      :is_completed,
      :due_date,
      :priority,
    )
  end

  def authenticate_user_from_token!
    user_token = params[:authentication_token].presence
    user = user_token && User.find_by_authentication_token(user_token.to_s)

    sign_in user, store: false if user
  end

  def authorize_for_item!
    @item = Item.find(params[:id])
    unless @item.user == current_user
      render json: { error: 'You cannot access this item' }, status: :forbidden
    end
  rescue
    render json: { error: 'Item not found' }, status: :not_found
  end
end
