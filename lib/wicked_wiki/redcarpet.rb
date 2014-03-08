require 'rouge/plugins/redcarpet'

module WickedWiki::Redcarpet
  def markdown(text)
    render_options = {
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow' }
    }
    renderer = HTML.new(render_options)
  
    extensions = {
      autolink:           true,
      fenced_code_blocks: true,
      lax_spacing:        true,
      no_intra_emphasis:  true,
      strikethrough:      true,
      superscript:        true
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end  

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
    include ActionView::Helpers

    def parse_media_link(link)
      matches = link.match(/^([\w\d\.]+)(?:\|(\w+))?(?:\|([\w\s\d]+))?$/)
      {
        :id => matches[1],
        :size => (matches[2] || 'original').to_sym,
        :class => matches[3]
  
      } if matches
    end
  
    def image(link, title, alt_text)
      size = nil
      klass = "wiki_img"
      if nil != (parse = parse_media_link(link))
        media = Image.find_by_id(parse[:id]) || Image.find_by_name(parse[:id])
        if media
          size = media.file.image_size(parse[:size])
          link = media.file.url(parse[:size])
          klass = parse[:class]
        end
      end
      image_tag(link, :size => size, :title => title, :alt => alt_text, :class => klass)
    end
  
    def link(link, title, content)
      klass = nil
      if nil != (parse = parse_media_link(link))
        media = Image.find_by_id(parse[:id]) || Image.find_by_name(parse[:id])
        if media
          link = media.file.url(parse[:size])
          klass = parse[:class]
        end
      end
      link_to(content, link, :title => title, :class => klass)
      end    
    end
  end