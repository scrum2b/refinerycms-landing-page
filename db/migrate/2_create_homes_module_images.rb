class CreateHomesModuleImages < ActiveRecord::Migration

  def up
    create_table :refinery_module_images do |t|
      t.integer :home_id
      t.integer :photo_id
      t.integer :photo_key

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-homes_module_images"})
    end

    drop_table :refinery_module_images

  end

end
