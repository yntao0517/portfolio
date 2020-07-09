class ItemsController < ApplicationController
skip_before_action :verify_authenticity_token

  def search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end

  def show
    @user = User.find(params[:id])
    @hospital_items = @user.hospital_items.all
  end

  def shortage
    @hospital = Hospital.find(params[:id])
    @item = Item.find_by(item_code: params[:item_code])

    if @item
      unless @hospital.items.find_by(item_code: params[:item_code])
        @item.hospitals << @hospital
      end
    else
      @hospital.items.create(name: params[:name], price: params[:price], image_url: params[:image_url], item_code: params[:item_code], item_url: params[:item_url])
    end
    redirect_back(fallback_location: root_path)
  end

  def support
    item = HospitalItem.find_by(item_id: params[:item_id], hospital_id: params[:hospital_id])
    @user = User.find(params[:id])
    unless @user.hospital_items.find_by(item_id: params[:item_id])
      item.users << @user
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    UserItem.find_by(hospital_item_id: params[:item_id], user_id: params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
