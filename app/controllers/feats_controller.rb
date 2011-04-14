class FeatsController < ApplicationController
  def index
    @feats = Feat.all
  end
end
