class AddLogoOverlayToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :logo_overlay, :boolean
  end

  def self.down
    remove_column :photos, :logo_overlay
  end
end
