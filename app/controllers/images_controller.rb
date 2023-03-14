class ImagesController < ApplicationController

  def new
    @image = current_user.images.build
  end

  def index
    @images = current_user.images.order(id: :desc)
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      redirect_to images_path
    else
      @errors = []
      @errors.concat(@image.errors.full_messages.each{|msg|msg})
      render 'new'
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :image_file)
  end


end
