module WickedWiki::Authentication
  def wicked_user
    send(WickedWiki.current_user_helper)
  end

  def wicked_user?
    !wicked_user.nil?
  end

  ##helpers prefixed with "ww" are used when applying protection rules
  alias_method :ww_current_user, :wicked_user
  alias_method :ww_user_signed_in?, :wicked_user?

  def ww_no_restriction
    true
  end

  def ww_wiki_author?
    wiki = Wiki.find(params[:id])
    wiki.user == wicked_user
  end

  def ww_admin_signed_in?
    if wicked_user?
      wicked_user.admin?
    else
      false
    end
  end

  def ww_wiki_author_or_admin?
    ww_wiki_author? || ww_admin_user?
  end
end
