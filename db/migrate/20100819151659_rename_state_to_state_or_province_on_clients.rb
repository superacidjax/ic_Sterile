class RenameStateToStateOrProvinceOnClients < ActiveRecord::Migration
  def self.up
    rename_column :clients, :state, :state_or_province
  end

  def self.down
    rename_column :clients, :state_or_province, :state
  end
end
