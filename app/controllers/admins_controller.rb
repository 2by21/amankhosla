class AdminsController < ApplicationController
  before_action :authenticate
  layout "admin_layout"

  def index
  end

end
