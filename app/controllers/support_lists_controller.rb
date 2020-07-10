class SupportListsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @hospital_items = @hospital.items.all
  end

  def users
    @item = Item.find(params[:item_id])
    item = HospitalItem.find_by(item_id: params[:item_id], hospital_id: params[:hospital_id])
    @users = item.users.all
  end
end
