class ChangeColumnOfArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :category_id
    add_reference :articles, :category, index:true
  end
end
