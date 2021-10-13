class RelaisController < ApplicationController
  def show
    @relais = Relai.all
  end
end
