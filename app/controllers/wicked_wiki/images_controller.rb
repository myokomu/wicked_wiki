module WickedWiki
  class ImagesController < ApplicationController
    before_action :set_image, only: [:show, :edit, :update, :destroy]
    before_action :authorize, only: [:new, :create, :destroy]

    def index
      @wiki = Wiki.find(params[:wiki_id])
      @images = Image.where(wiki_id: @wiki.id)
    end

    def show
      @wiki = Wiki.find(params[:wiki_id])
      @images = Image.find(params[:id])
    end

    def new
      @wiki = Wiki.find(params[:wiki_id])
      @image = @wiki.images.new
    end

    def create
      @wiki = Wiki.find(params[:wiki_id])
      @image = @wiki.images.new(image_params)

      if @image.save
        redirect_to [@wiki, @image]
      else
        render action: 'new'
      end
    end

    def update
      if @image.update(image_params)
        redirect_to @image, notice: 'Image was successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      @image.destroy
      redirect_to images_url, notice: 'Image was successfully destroyed.'
    end

    private
      def set_image
        @image = Image.find(params[:id])
      end

      def image_params
        params.require(:image).permit(:name, :file)
      end
  end
end
