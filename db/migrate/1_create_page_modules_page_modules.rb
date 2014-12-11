class CreatePageModulesPageModules < ActiveRecord::Migration

  def up
    create_table :refinery_page_modules do |t|
      t.string :title
      t.string :type_module
      t.text :body
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-page_modules"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/page_modules/page_modules"})
    end

    drop_table :refinery_page_modules

  end

end
