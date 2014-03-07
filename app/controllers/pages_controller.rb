class PagesController < ApplicationController
  before_filter :authenticate_user!

  def app
    render layout: 'emberapp'
  end
end
