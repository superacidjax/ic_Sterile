class ChangeSessionToCounselingSession < ActiveRecord::Migration
  def self.up
    rename_table :sessions, :counseling_sessions
  end

  def self.down
    rename_table :counseling_sessions, :sessions
  end
end
