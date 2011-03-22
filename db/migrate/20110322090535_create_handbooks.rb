class CreateHandbooks < ActiveRecord::Migration
  def self.up
    create_table :handbooks do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :handbooks
  end
end
