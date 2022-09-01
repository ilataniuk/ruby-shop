class ApplicationController < ActionController::Base

  helper_method :current_order
  add_flash_types :info, :error, :warning

  def current_order
    Order.find_or_create_by(status: Order.statuses[:in_progress])
  end

end
