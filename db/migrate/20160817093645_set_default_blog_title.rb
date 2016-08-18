class SetDefaultBlogTitle < ActiveRecord::Migration
  def change
    change_column_default :settings, :title, 'Hisalog'
  end
end
