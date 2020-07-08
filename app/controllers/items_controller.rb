class ItemsController < ApplicationController
skip_before_action :verify_authenticity_token

  def search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def shortage
    @hospital = Hospital.find(session[:hospital])
    @item = Item.find_by(item_code: params[:item_code])

    if @item
      unless @hospital.items.find_by(item_code: params[:item_code])
        @item.hospitals << @hospital
      end
      redirect_back(fallback_location: posts_url)
    else
      @hospital.items.create(name: params[:name], price: params[:price], image_url: params[:image_url], item_code: params[:item_code], item_url: params[:item_url])
      redirect_back(fallback_location: posts_url)
    end
  end
end
