class AcceptNullInTheCategory < ActiveRecord::Migration
  def change
    change_column_null :articles, :category_id, true
  end
end
