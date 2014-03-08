class AddSlugToWickedWikiWikis < ActiveRecord::Migration
  def change
  	add_column :wicked_wiki_wikis, :slug, :string
  	add_index :wicked_wiki_wikis, :slug, unique: true
  end
end
