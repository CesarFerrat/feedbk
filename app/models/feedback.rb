class Feedback < ActiveRecord::Base
  belongs_to :user
  belongs_to :goal
  belongs_to :user
end
