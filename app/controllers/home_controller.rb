class HomeController < ApplicationController
  def index
    @logged_items = current_user.logged_items
  end
end
