class CreateTeamsUsers < ActiveRecord::Migration
  def change
    create_table :teams_users, id: false do |t|
    end
  end
end
