# This file contains settings for Wicked Wiki.
# Be sure to restart your server after you modify this file.
# Change your color scheme if your eyes get sore by staring at comments chunks!

######GENERAL######
#The default values in this section follow Devise's convensions. If you use 
#Devise with no customization, you can leave them alone.

#WickWiki expects a current_user method defined in your controller. If you identify 
#your current user using another method, specify it below
WickedWiki.current_user_helper = :current_user

#What is your user class called?
WickedWiki.user_class = "User"

#Your sign-in-path.
#Example of custom sign_in_path:  WickedWiki.sign_in_path = :sign_in_path
WickedWiki.sign_in_path = "new_#{WickedWiki.user_class.to_s.underscore}_session_path"

#If authorization fails, which path do you want user to be redirected to?
#1. If it's a path defined in your own app 
#WickedWiki.auth_redirected_path = :your_own_path
#2. If it's a path defined in WickedWiki, prefix with "wicked_wiki_" like the following
#WickedWiki.auth_redirected_path = :wicked_wiki_wikis_path
#3. If it's your sign_in_path defined above
WickedWiki.auth_redirect_path = WickedWiki.sign_in_path


######INTERNATIONALIZATION######
#Wicked Wiki supports I18n. Do you indent to use more than one language?
WickedWiki.multilingual = true


######PROTECTION######
#You can customize protection rules using the hash below. There are a few rules:
##1. Use string for protection type and symbol for everything else(action and its
##   corresponding authentication helper).
##2. You don't need to stick with the existing protection types. Feel free to delete
##   them and add your own. BUT you need to keep the ["general"] type!
##3. Authentication helper for rendering wikis#new is defined in ["general"]. You can
##   change its helper, but keep the protection type and the action.
##4. Authentication helper for :create in each protection type is used when you want to 
##   create a wiki page which has that specific protection, same goes for :edit and 
##   :destroy
##5. You don't need to specify a helper for :update since it should be the same
##   as :edit. 
##6. You can use either your own helper methods or methods provided by WickedWiki.
##   All WickedWiki methods are prefixed with 'ww'.
##7. A wiki's authentication helpers for :edit and :destroy are used for uploading and
##   deleting its image.
##8. You don't need to have an admin attribute in your user model to use this gem. 
##   Just don't use any helpers that involves admin if that's the case.
 

##available helpers
##ww_no_restriction
##ww_user_signed_in?
##ww_admin_user?           #don't use unless your user_class responds to admin?
##ww_page_author?
##ww_page_author_or_admin? #don't use unless your user_class responds to admin?

WickedWiki.protections = {
  "general" => {
    :new => :ww_no_restriction
  },

  "no protection" => {
  	:create =>  :ww_no_restriction,
  	:edit =>    :ww_no_restriction,
  	:destroy => :ww_user_signed_in?
  },

  "semi-protection" => {
  	:create => :ww_user_signed_in?,
  	:edit =>   :ww_user_signed_in?,
  	:destroy => :ww_user_signed_in?
  },

  "full protection" => {
  	:create => :ww_user_signed_in?,
  	:edit =>   :ww_user_signed_in?,
  	:destroy => :ww_user_signed_in?
  },

  "personal" => {
    :create => :ww_user_signed_in?,
    :edit =>   :ww_user_signed_in?,
    :destroy => :ww_user_signed_in?
  }
}