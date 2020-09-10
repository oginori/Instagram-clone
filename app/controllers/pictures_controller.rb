class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    picture = Picture.new(picture_params)
    if picture.save
      redirect to new_picture_path
    else
    end
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
