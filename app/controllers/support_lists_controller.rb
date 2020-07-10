class SupportListsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @hospital_items = @hospital.items.all
  end
end
