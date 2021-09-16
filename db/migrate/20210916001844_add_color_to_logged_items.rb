class AddColorToLoggedItems < ActiveRecord::Migration[5.2]
  def change
    add_column :logged_items, :color, :string, null: false, default: ""
  end
end
