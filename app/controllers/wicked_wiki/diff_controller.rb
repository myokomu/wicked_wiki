module WickedWiki
  class DiffController < ApplicationController
    def show
      @target = Revision.find(params[:t_id]).content
      source  = Revision.find(params[:s_id]).content
      @diff   = WickedWiki::Diff.new(@target, source).compare_articles      
    end

    def create
      target = params[:target_id]
      source = params[:source_id]
      redirect_to "/diff/#{target}/and/#{source}"
    end
  end
end