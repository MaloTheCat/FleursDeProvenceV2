class Composition < ApplicationRecord
  belongs_to :florist

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

  # def get_price_by_size
  #   case @composition.size
  #   when @composition.size == "M"
  #     @composition.price + 10
  #   when @composition.size == "L"
  #     @composition.price + 20
  #   else
  #     @composition.price
  #   end
  # end
end
