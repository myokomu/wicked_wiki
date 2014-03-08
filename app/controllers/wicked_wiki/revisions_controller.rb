require_dependency "wicked_wiki/application_controller"

module WickedWiki
  class RevisionsController < WickedWiki::ApplicationController
    def index
      @wiki   = Wiki.find(params[:wiki_id])
      @revisions = Revision.where(wiki_id: @wiki.id).order('created_at DESC')
    end 

    def show
      @revision = Revision.find(params[:id])
    end
  end
end
