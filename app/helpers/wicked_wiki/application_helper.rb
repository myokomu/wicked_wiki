module WickedWiki
  module ApplicationHelper
    include WickedWiki::Authentication
    include WickedWiki::Redcarpet
    
    def t!(key)
      t("wicked_wiki." + key)
    end

    def wicked_author(wiki)
      if wiki.user_id?
        link_to(wiki.author.name, wiki.author)
      else
        wiki.ip
      end
    end

    def protection_discription(protection)
      t("protection.discription.#{protection}")
    end

    def error_messages(object)
      return "" if object.errors.empty?
      messages = object.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
      sentence = I18n.t("errors.messages.not_saved",
                        :count => object.errors.count,
                        :resource => object.class.model_name.human.downcase)

      html = <<-HTML
      <div id="error_explanation">
        <h2>#{sentence}</h2>
        <ul>#{messages}</ul>
      </div>
      HTML
      html.html_safe
    end   
  end
end