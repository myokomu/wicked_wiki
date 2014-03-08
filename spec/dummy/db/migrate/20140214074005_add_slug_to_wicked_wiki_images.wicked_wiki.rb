# This migration comes from wicked_wiki (originally 20140214072546)
class AddSlugToWickedWikiImages < ActiveRecord::Migration
  def change
  	add_column :wicked_wiki_images, :slug, :string
  	add_index :wicked_wiki_images, :slug, unique: true
  end
end
