module WickedWiki
  module WikisHelper
    def available_protections(wiki)
      protections = WickedWiki.protections.except("general")
      options = protections.inject([]) do |r, (k, v)|
        send(v[:create]) ? r << k : r
      end
    end

    def first_element(s)
      s.first.to_s
    end

    def no_matching_protection
      raise "The current user cannot create wiki page of any"\
        "protection type. Please refer to rules of setting"\
        "protections in config/initializers/wicked_wiki.rb."	  
    end	
  end
end
