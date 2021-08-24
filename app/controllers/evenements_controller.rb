class EvenementsController < ApplicationController

  def home
    @evenements = Evenement.all
  end

end
