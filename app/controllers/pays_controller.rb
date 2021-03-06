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
    Payjp.api_key = Rails.application.credentials.payjp[:payjp_private_key]
    Payjp::Charge.create(
      amount: params['pay_price'],
      currency: "jpy",
      card: params['payjp-token']
    )
    redirect_to pay_fin_path
  end

  def pay_fin
  end
end
