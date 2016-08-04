class RejectNullInComments < ActiveRecord::Migration
  def change
    change_column_null :comments, :name, false
    change_column_null :comments, :content, false
  end
end
