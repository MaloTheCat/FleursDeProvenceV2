class CompositionsController < ApplicationController

  def index
    @compositions = Composition.all
  end

  def new
    @composition = Composition.new
  end

  def create
    @composition = Composition.new
    if @composition.save
      redirect_to root_path
    else
      render:new
    end
  end

end
