class CompositionsController < ApplicationController

  def index
    @florist = Florist.find(id=3)
    @compos = @florist.compositions
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

end
