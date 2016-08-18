class Setting < ActiveRecord::Base
  validates :title, presence: true
end
