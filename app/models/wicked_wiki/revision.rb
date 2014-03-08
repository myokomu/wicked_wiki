module WickedWiki
  class Revision < ActiveRecord::Base
    include WickedWiki::Validations

    validates :wiki_id,    presence: true	
    validates :content,    presence: true
    validate  :user_or_ip_present?
    belongs_to :wiki

    def self.create(wiki)
      revision = Revision.new(user_id: wiki.user_id, wiki_id: wiki.id, content: wiki.content, ip: wiki.ip)
      revision.save
    end
    
    def title
      wiki.title
    end

    def author_or_ip
      user_id? ? WickedWiki.user_class.constantize.find(user_id).name : ip
    end
  end
end
