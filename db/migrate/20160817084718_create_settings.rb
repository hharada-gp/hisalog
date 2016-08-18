class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :title, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
