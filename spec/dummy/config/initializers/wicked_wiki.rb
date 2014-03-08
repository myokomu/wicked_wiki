#####All settings here are configured for testing. #####

WickedWiki.current_user_helper = :current_user

WickedWiki.user_class = "User"

WickedWiki.sign_in_path = "new_#{WickedWiki.user_class.to_s.underscore}_session_path"

WickedWiki.auth_redirect_path = "wicked_wiki_wikis_path"

WickedWiki.multilingual = true

WickedWiki.protections = {
  "general" => {
    :new => :ww_no_restriction
  },

  "no protection" => {
    :create => :ww_no_restriction,
    :edit =>   :ww_no_restriction,
    :destroy => :ww_no_restriction
  },

  "semi-protection" => {
    :create => :ww_user_signed_in?,
    :edit =>   :ww_user_signed_in?,
    :destroy => :ww_admin_signed_in?
  },

  "full protection" => {
    :create => :ww_admin_signed_in?,
    :edit =>   :ww_admin_signed_in?,
    :destroy => :ww_admin_signed_in?
  },

  "creator protection" => {
    :create => :ww_user_signed_in?,
    :edit =>   :ww_page_author_or_admin?,
    :destroy => :ww_page_author_or_admin?
  }
}


###############################
##backup of the protection hash


#WickedWiki.protections = {
#  "general" => {
#    :new => :ww_no_restriction
#  },
#
#  "no protection" => {
#    :create => :ww_no_restriction,
#    :edit =>   :ww_no_restriction,
#    :destroy => :ww_no_restriction
#  },
#
#  "semi-protection" => {
#    :create => :ww_user_signed_in?,
#    :edit =>   :ww_user_signed_in?,
#    :destroy => :ww_admin_signed_in?
#  },
#
#  "full protection" => {
#    :create => :ww_admin_signed_in?,
#    :edit =>   :ww_admin_signed_in?,
#    :destroy => :ww_admin_signed_in?
#  },
#
#  "creator protection" => {
#    :create => :ww_user_signed_in?,
#    :edit =>   :ww_page_author_or_admin?,
#    :destroy => :ww_page_author_or_admin?
#  }
#}