module WickedWiki
  class Image < ActiveRecord::Base
    extend FriendlyId

    friendly_id :name, use: [:slugged, :finders]
    has_attached_file :file, styles: { medium: "300x300>", thumb: "100x100>" }

    validates :name, presence: true, uniqueness: true
    validates :wiki_id, presence: true
    validates :file, presence: true
    validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

    belongs_to :wiki
   end
end
