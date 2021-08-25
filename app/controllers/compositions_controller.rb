class CompositionsController < ApplicationController

  def index
    @compo = Composition.all
  end

  def new
    @compo = Composition.new
  end

  def create
    @compo = Composition.new
    if @compo.save
      redirect_to root_path
    else
      render:new
    end
  end

  def get_image_tag
    image_tag = "#{photo_title}.png"
    # image_tag = ""
    # if photo_title.present?
      # if photo_title.start_with?("https")
      #   image_tag = photo_title
      # else
      # end
    # end
    # raise
    # image_tag
  end

end
