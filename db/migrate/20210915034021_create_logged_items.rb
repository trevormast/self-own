class CreateLoggedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :logged_items do |t|
      t.string :name, null: false, default: ""
      t.string :value_type, null: false, default: ""


      t.timestamps null: false
    end
  end
end
