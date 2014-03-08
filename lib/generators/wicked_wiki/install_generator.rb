require 'rails/generators'

module WickedWiki
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)  
      def install
        template "wicked_wiki.rb", "config/initializers/wicked_wiki.rb"
        route "mount WickedWiki::Engine => '/'"
        rake 'wicked_wiki:install:migrations'
        rake 'db:migrate'
      end
    end
  end
end