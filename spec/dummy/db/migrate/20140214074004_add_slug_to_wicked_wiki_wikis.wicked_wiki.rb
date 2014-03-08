# This migration comes from wicked_wiki (originally 20140214072538)
class AddSlugToWickedWikiWikis < ActiveRecord::Migration
  def change
  	add_column :wicked_wiki_wikis, :slug, :string
  	add_index :wicked_wiki_wikis, :slug, unique: true
  end
end
