class HospitalChatsController < ApplicationController
  def show
  @hospital = Hospital.find(session[:hospital])
  hospital_id = @hospital.id
  hospital_item = HospitalItem.find_by(hospital_id: hospital_id)
    if hospital_item != nil
      @users = hospital_item.users.all
    end
  end
end
