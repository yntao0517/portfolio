class UserChatsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @hospital_items = @user.hospital_items
    @hosptial_ids = []
    @hospital_items.each do |item|
      @hospital_ids.push(item.hospital_id)
    end
  end
end
