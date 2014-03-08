module WickedWiki
  class WikisController < WickedWiki::ApplicationController
    before_action :authorize, except: [:index, :show]

    def index
      if params[:query].present?
        @wikis = Wiki.search(params[:query])
      else
        @wikis = Wiki.recent(10)
      end
    end
  
    def new
      @wiki  = Wiki.new
    end
  
    def create
      @wiki =  Wiki.new(wiki_params)
      if @wiki.save_and_create_revision
        redirect_to wikis_path
        flash[:success] = "Wiki created!"
      else
        render 'new'
      end
    end
  
    def show
      @wiki = Wiki.find(params[:id])
    end
  
    def edit
      @wiki = Wiki.find(params[:id])
    end
  
    def update
      @wiki = Wiki.find(params[:id])
      return unless assign_attr_and_check_changes
      if @wiki.save_and_create_revision && 
        flash[:success] = "Wiki updated!"
        redirect_to @wiki
      else
        flash[:danger] = "Wiki not updated."
        render 'edit'
      end
    end  
  
    private

    def restrict_create
      send(WickedWiki.restrict_create)
    end
    
    def wiki_params
      params.require(:wiki).permit(:title, :content, :protection, :user_id, :ip)
    end   

    def update_params
      params.require(:wiki).permit(:content, :ip, :user_id)
    end

    def assign_attr_and_check_changes
      @wiki.assign_attributes(update_params)
      unless @wiki.content_changed?
        flash.now[:warning] = "Seems like you didn't make any modifications."##translate
        render 'edit'
        false
      else
        true
      end
    end
  end    
end
