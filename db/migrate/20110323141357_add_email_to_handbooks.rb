class AddEmailToHandbooks < ActiveRecord::Migration
  def self.up
    add_column :handbooks, :email, :string
  end

  def self.down
    remove_column :handbooks, :email
  end
end
