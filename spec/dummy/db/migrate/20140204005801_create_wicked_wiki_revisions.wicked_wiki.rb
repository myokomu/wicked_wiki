# This migration comes from wicked_wiki (originally 20140124052030)
class CreateWickedWikiRevisions < ActiveRecord::Migration
  def change
    create_table :wicked_wiki_revisions do |t|
      t.text     :content	
      t.integer  :wiki_id
      t.integer  :user_id
      t.string   :ip
      t.timestamps
    end
    add_index :wicked_wiki_revisions, :wiki_id
    add_index :wicked_wiki_revisions, :ip
    add_index :wicked_wiki_revisions, :user_id
  end
end
