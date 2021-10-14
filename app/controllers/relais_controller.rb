class RelaisController < ApplicationController

  def show
    @relais = Relai.all
  end

  def get
    @relai = Relai.first
  end

end
