class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      hospital_log_in @hospital
      flash[:success] = "Welcome to the Coid"
      redirect_to @hospital
    else
      render 'new'
    end
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  def update
    @hospital = Hospital.find(params[:id])
    if @hospital.update_attributes(hospital_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @hospital
    else
      render 'edit'
    end
  end

  private

  def hospital_params
    params.require(:hospital).permit(:name, :email, :password,
                                     :password_confirmation, :address,
                                     :phone_number, :representative)
  end
end
