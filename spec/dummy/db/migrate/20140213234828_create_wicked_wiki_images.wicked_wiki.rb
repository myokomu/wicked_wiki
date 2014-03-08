# This migration comes from wicked_wiki (originally 20140213215407)
class CreateWickedWikiImages < ActiveRecord::Migration
  def change
    create_table :wicked_wiki_images do |t|
      t.string :name
      t.string :file_meta
      t.integer :wiki_id
      t.attachment :file      
      t.timestamps
    end
    add_index :wicked_wiki_images, :name
  end
end
