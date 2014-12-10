class CreateHomesHomes < ActiveRecord::Migration

  def up
    create_table :refinery_homes do |t|
      t.string :title
      t.string :type_module
      t.text :content
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-homes"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/homes/homes"})
    end

    drop_table :refinery_homes

  end

end
