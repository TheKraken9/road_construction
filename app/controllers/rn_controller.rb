class RnController < ApplicationController
  def index
    @rn = Rn.all.to_a
  end
end
