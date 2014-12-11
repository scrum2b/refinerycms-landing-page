class RenameHomeIdPageModuleImages < ActiveRecord::Migration

  def up
    rename_column :refinery_page_module_images, :home_id, :page_module_id
  end

  def down
    rename_column :refinery_page_module_images, :home_id, :page_module_id
  end

end