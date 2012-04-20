class AddVideoSessionIdToCounselingSessions < ActiveRecord::Migration
  def self.up
    add_column :counseling_sessions, :video_session_id, :string
  end

  def self.down
    remove_column :counseling_sessions, :video_session_id
  end
end
