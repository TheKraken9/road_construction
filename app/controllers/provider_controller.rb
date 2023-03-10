class ProviderController < ApplicationController
  def index
    @provider = Provider.all.to_a
    @rn = Rn.all.to_a
  end
end
