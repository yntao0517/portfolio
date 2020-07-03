module HospitalSessionsHelper

  def hospital_log_in(hospital)
    session[:hospital_id] = hospital.id
  end

  def current_hospital
    if session[:hospital_id]
      @current_hospital ||= Hospital.find_by(id: session[:hospital_id])
    end
  end

  def hospital_logged_in?
    !current_hospital.nil?
  end

  def hospital_log_out
    session.delete(:hospital_id)
    @current_hospital = nil
  end
end
