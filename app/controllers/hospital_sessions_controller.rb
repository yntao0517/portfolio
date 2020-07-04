class HospitalSessionsController < ApplicationController
  def new
  end

  def create
    hospital = Hospital.find_by(email: params[:session][:email].downcase)
    if hospital && hospital.authenticate(params[:session][:password])
      hospital_log_in hospital
      params[:session][:remember_me] == '1' ? hospital_remember(hospital) : forget(hospital)
      redirect_to hospital
    else
      flash.now[:danger] = "メールアドレスまたはパスワードが正しくありません。"
      render 'new'
    end
  end

  def destroy
    hospital_log_out if hospital_logged_in?
    redirect_to root_url
  end
end
