class FixTeamusers < ActiveRecord::Migration
  def change
  	change_table :teams_users, id: false do |t|
      t.belongs_to :team, index: true
      t.belongs_to :user, index: true
    end
  end
end
