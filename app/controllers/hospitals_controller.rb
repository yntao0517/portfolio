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
      flash[:success] = "Welcome to the Coid"
      redirect_to @hospital
    else
      render 'new'
    end
  end

  private

  def hospital_params
    params.require(:hospital).permit(:name, :email, :password,
                                     :password_confirmation, :address,
                                     :phone_number, :representative)
  end
end
