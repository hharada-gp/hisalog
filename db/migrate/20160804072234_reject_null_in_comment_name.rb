class RejectNullInCommentName < ActiveRecord::Migration
  def change
    change_column_null :comments, :name, false
  end
end
