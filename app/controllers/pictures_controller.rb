class PicturesController < ApplicationController
  before_action :login_judgment, only: [:show]
  before_action :set_picture, only: [:edit, :update, :show, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        #PictureMailer.picture_mail(@picture).deliver
        redirect_to pictures_path, notice: 'Post was successfully created'
      else
        render :new
      end
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def edit
    if current_user.id != @picture.user.id
      redirect_to pictures_path
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "Successfully edited your post!"
    else
      render :edit
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "Successfully deleted!"
  end

  private

  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
