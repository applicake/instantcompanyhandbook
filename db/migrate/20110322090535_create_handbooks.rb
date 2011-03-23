class CreateHandbooks < ActiveRecord::Migration
  def self.up
    create_table :handbooks, :id => false do |t|

      t.string :id, :limit => 36, :primary => true
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :handbooks
  end
end
