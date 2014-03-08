# This migration comes from wicked_wiki (originally 20140124051948)
class CreateWickedWikiWikis < ActiveRecord::Migration
  def change
    create_table :wicked_wiki_wikis do |t|
      t.string  :title
      t.text    :content
      t.string  :protection, default: 'none'
      t.integer :user_id
      t.string  :ip
      t.timestamps
    end
    add_index :wicked_wiki_wikis, :title, unique: true
    add_index :wicked_wiki_wikis, :ip
    add_index :wicked_wiki_wikis, :user_id
  end
end
