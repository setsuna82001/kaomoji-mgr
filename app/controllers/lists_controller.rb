class ListsController < ApplicationController
  def index
    
    @list = Settings.kaomoji
      .uniq
      .sort{|a,b| a.txt <=> b.txt }
    
    #render json: Settings.kaomoji.to_json
  end
end
