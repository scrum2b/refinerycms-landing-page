class RenameLandingPagesTable < ActiveRecord::Migration
	def self.up
    rename_table :refinery_landing_pages, :refinery_page_modules
  end 
  def self.down
    rename_table :refinery_landing_pages, :refinery_page_modules
  end
end