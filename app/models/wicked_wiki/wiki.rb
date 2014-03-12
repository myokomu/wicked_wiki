module WickedWiki
  class Wiki < ActiveRecord::Base
    include WickedWiki::Validations
    include Tire::Model::Search
    include Tire::Model::Callbacks
    extend FriendlyId
    
    PROTECTION_TYPES = WickedWiki.protections.except("general")
    
    friendly_id :title, use: [:slugged, :finders]

    validates_inclusion_of :protection, {:in => PROTECTION_TYPES}
    validates :title,   presence: true, length: { minimum: 1, maximum: 144}, uniqueness: true
    validates :content, presence: true, length: { minimum: 5 }
    validate  :user_or_ip_present?

    has_many   :revisions
    has_many   :images
    belongs_to WickedWiki.user_class.downcase.to_sym

    scope :recent, ->(n) { order('updated_at DESC').limit(n) }

    class << self
      def protection_types
        PROTECTION_TYPES      
      end
    end

    def author
      if user
        user.name
      else
        ip
      end
    end

    def save_and_create_revision
      self.save
      Revision.create(self)
    rescue SystemCallError => e
      raise "): It seems like you either don't elasticsearch booted up 
             or you don't have it installed. You can find instructions 
             for installing elasticsearch here: https://github.com/karmi/retire"
    end
  end
end
