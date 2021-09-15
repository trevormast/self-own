class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :value, null: false, default: ""
      t.references :logged_item

      t.timestamps
    end
  end
end
