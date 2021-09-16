class AddUserIdToLoggedItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :logged_items, :user
  end
end
