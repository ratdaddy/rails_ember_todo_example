class ItemsController < ApplicationController
  before_filter :authenticate_user_from_token!
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

  def authenticate_user_from_token!
    user_token = params[:authentication_token].presence
    user       = user_token && User.find_by_authentication_token(user_token.to_s)

    if user
      sign_in user, store: false
    end
  end
end
