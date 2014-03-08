module WickedWiki::Internationalization
  #Wicked Wiki supports multilingual out of the box. But the url
  #param for locale will show only when multilingual is set to false
  def locale_url_param
  	if WickedWiki.multilingual
      /#{I18n.available_locales.join("|")}/
    else
      ""
    end
  end

  def set_user_language
    I18n.locale = params[:locale] if WickedWiki.multilingual
  end
end