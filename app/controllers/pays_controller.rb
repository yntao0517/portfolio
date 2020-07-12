class PaysController < ApplicationController
  def show
    if logged_in?
      @user = User.find(params[:id])
      @hospital_items = @user.hospital_items.all
      @sum = 0
    else
      redirect_to root_path
    end
  end

  def pay
  end
end
