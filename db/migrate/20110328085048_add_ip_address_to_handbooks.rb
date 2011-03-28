class AddIpAddressToHandbooks < ActiveRecord::Migration
  def self.up
    add_column :handbooks, :ip_address, :string
  end

  def self.down
    remove_column :handbooks, :ip_address
  end
end
