class ItemsController < ApplicationController
  def search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
