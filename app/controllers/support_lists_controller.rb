class SupportListsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @hospital = Hospital.find(params[:id])
    @hospital_items = @user.hospital_items.all
  end
end
