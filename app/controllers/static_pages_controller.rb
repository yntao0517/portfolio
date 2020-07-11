class StaticPagesController < ApplicationController
  def home
    @items = Item.all
    @hospital = Hospital.find(params[:id])
  end
end
