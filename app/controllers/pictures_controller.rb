class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to new_picture_path
  end

  def edit
  end

  def show
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end
end
