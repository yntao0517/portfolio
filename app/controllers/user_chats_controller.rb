class UserChatsController < ApplicationController
  def show
    @hospital = Hospital.find(current_hospital)
    hospital_id = @hospital.id
    hospital_item = HospitalItem.find_by(hospital_id: hospital_id)
    if hospital_item.present?
      @users = hospital_item.users.all
    end
  end
end
