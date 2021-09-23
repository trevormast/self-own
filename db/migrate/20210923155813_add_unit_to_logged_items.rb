class AddUnitToLoggedItems < ActiveRecord::Migration[5.2]
  def change
    add_column :logged_items, :unit, :string, null: false, default: ''
  end
end
