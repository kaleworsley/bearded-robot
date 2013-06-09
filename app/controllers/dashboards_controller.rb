class DashboardsController < ApplicationController
  def root
    authorize! { current_user.present? }
  end
end
