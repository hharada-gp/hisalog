class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :article, index:true, foreign_ley: true, null: false
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
