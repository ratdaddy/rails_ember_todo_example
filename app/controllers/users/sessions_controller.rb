class Users::SessionsController < Devise::SessionsController
  respond_to :html, :json
  skip_before_action :verify_authenticity_token, if: :csrf_safe?

protected

  def csrf_safe?
    action_name == 'create' && request.format.json?
  end
end
