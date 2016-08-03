class RejectNull < ActiveRecord::Migration
  def change
    change_column_null :articles, :category_id, false
  end
end
