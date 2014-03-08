class WickedWiki::ApplicationController < ApplicationController
  include WickedWiki::Authentication
  include WickedWiki::Authorization
  include WickedWiki::Internationalization
  
  helper_method :user_authorized_to?
  before_filter :set_user_language
  
  def default_url_options(options = {})
    {locale: I18n.locale} 
  end
end