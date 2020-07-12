class HospitalPasswordChangesController < ApplicationController
  before_action :logged_in_hospital, only: [:edit, :update]
  before_action :correct_hospital, only: [:edit, :update]

  def edit
  end

  def update
    if params[:hospital][:password].empty?
      @hospital.errors.add(:password, :blank)
      render 'edit'
    elsif @hospital.authenticate(params[:hospital][:old_password]) &&
       @hospital.update(hospital_params)
      hospital_log_in @hospital
      flash[:success] = "パスワードは変更されました。"
      redirect_to @hospital
    else
      flash[:danger] = "一致しない項目があります。"
      render 'edit'
    end
  end

  private

  def hospital_params
    params.require(:hospital).permit(:password, :password_confirmation)
  end

  def logged_in_hospital
    unless hospital_logged_in?
      hospital_store_location
      flash[:danger] = "ログインしてください"
      redirect_to hospital_login_path
    end
  end

  def correct_hospital
    @hospital = Hospital.find(params[:id])
    redirect_to(root_url) unless current_hospital?(@hospital)
  end
end
