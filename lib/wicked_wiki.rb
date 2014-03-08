require "wicked_wiki/validations"
require "wicked_wiki/engine"
require "wicked_wiki/authentication"
require "wicked_wiki/authorization"
require "wicked_wiki/internationalization"
require "wicked_wiki/redcarpet"
require "wicked_wiki/diff/diff"

module WickedWiki  
  mattr_accessor :current_user_helper;  @@current_user_helper = :current_user
  mattr_accessor :multilingual;         @@multilingual = false
  mattr_accessor :user_class;           @@user_class = "User"in
  mattr_accessor :auth_redirect_path
  mattr_accessor :protections
  mattr_accessor :sign_in_path  
end
