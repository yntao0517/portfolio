class HospitalItemsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
  end
end
