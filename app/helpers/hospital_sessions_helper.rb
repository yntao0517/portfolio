module HospitalSessionsHelper

  def hospital_log_in(hospital)
    session[:hospital_id] = hospital.id
  end

  def hospital_remember(hospital)
    hospital.hospital_remember
    cookies.permanent.signed[:hospital_id] = hospital.id
    cookies.permanent[:remember_token] = hospital.remember_token
  end

  def current_hospital
    if (hospital_id = session[:hospital_id])
      @current_hospital ||= Hospital.find_by(id: hospital_id)
    elsif(user_id = cookies.signed[:hospital_id])
      hospital = Hospital.find_by(id: hospital_id)
      if hospital && hospital.authenticated?(cookies[:remember_token])
        hospital_log_in hospital
        @current_hospital = hospital
      end
    end
  end

  def hospital_logged_in?
    !current_hospital.nil?
  end

  def forget(hospital)
    hospital.forget
    cookies.delete(:hospital_id)
    cookies.delete(:remember_token)
  end

  def hospital_log_out
    session.delete(:hospital_id)
    @current_hospital = nil
  end
end
